import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/common/token_ext.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class TokenInterceptor implements Interceptor {
  final DBService dbService;

  TokenInterceptor(this.dbService);

  @override
  FutureOr<Response<T>> intercept<T>(Chain<T> chain) async {
    final request = chain.request;

    Response<T> response;
    try {
      response = await chain.proceed(request);
    } catch (e, s) {
      LogService.w("❌ Error $e--- Path: $s");
      rethrow;
    }

    if (response.statusCode == 401) {
      final refreshToken = dbService.token.refreshToken;

      if (refreshToken == null || refreshToken.isEmpty) {
        LogService.w("❌ No valid refresh token. Signing out...");
        await dbService.signOut();
        await dbService.setLang(isSaved: false);
        return response;
      }

      final authRepo = AuthRepository(
        dbService,
        AuthService.create(dbService),
        PatientService.create(dbService),
        RefreshService.create(dbService),
      );

      final refreshResult = await authRepo.refreshToken(refreshToken);

      return await refreshResult.fold(
        (failure) async {
          await dbService.signOut();
          await dbService.setLang(isSaved: false);
          return response;
        },
        (data) async {
          dbService.setToken(Token(
            accessToken: data.accessToken,
            refreshToken: refreshToken,
            tokenType: data.tokenType,
          ));

          final newToken = dbService.token.toBearerToken;
          final headers = Map<String, String>.from(request.headers);
          headers['Authorization'] = newToken ?? 'Bearer ';
          headers['uuid'] = dbService.getUid ?? '';

          final newRequest = Request(
            request.method,
            request.url,
            request.uri,
            body: request.body,
            headers: headers,
            parameters: request.parameters,
          );

          return await chain.proceed(newRequest);
        },
      );
    }
    return response;
  }
}
