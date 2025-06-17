import 'dart:async';
import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medion/domain/common/token_ext.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';

class CoreInterceptor implements Interceptor {
  final DBService dbService;
  final GlobalKey<NavigatorState> navigatorKey;

  CoreInterceptor(this.dbService, this.navigatorKey);

  @override
  FutureOr<Response<T>> intercept<T>(Chain<T> chain) async {
    // 1. Get current locale
    final locale = _getCurrentLocale();
    final languageCode = locale.languageCode; // e.g., 'uz'
    final fullLocale = locale.toString(); // e.g., 'uz_UZ'

    // 2. Modify request
    var request = chain.request;

    // Add Accept-Language header
    final headers = Map<String, String>.from(request.headers);
    headers['Accept-Language'] = languageCode;

    // Add lang query parameter
    final url = request.url.replace(queryParameters: {
      ...request.url.queryParameters,
      'lang': fullLocale,
    });

    // Create new request with updated URL and headers
    final newRequest = Request(
      request.method,
      url,
      request.uri,
      body: request.body,
      headers: headers,
      parameters: request.parameters,
    );

    // 3. Add UUID
    newRequest.headers['uuid'] = dbService.getUid ?? "";

    // 4. Handle token
    final requiresToken =
        newRequest.headers['requires-token'] == 'true' || newRequest.headers['requires-token'] == 'optional';

    if (requiresToken) {
      if (dbService.token.toBearerToken != null) {
        log("\n\n\n**********TOKENS******** ");
        log("Access Token: ${dbService.token.accessToken}");
        log("Refresh Token: ${dbService.token.refreshToken}");
        log("Token type: ${dbService.token.tokenType}");
        log("getCurrencyPreference: ${dbService.getCurrencyPreference}");
        log("U_id: ${dbService.getUid}");
        log("To Bearer Token: ${dbService.token.toBearerToken}");
        log("******************\n\n\n");
        newRequest.headers['Authorization'] = dbService.token.toBearerToken!;
      } else if (newRequest.headers['requires-token'] != 'optional') {
        throw Exception('invalid_credential'.tr());
      }
    }

    return chain.proceed(newRequest);
  }

  Locale _getCurrentLocale() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return EasyLocalization.of(context)?.locale ?? const Locale('en', 'US');
    }
    return const Locale('en', 'US'); // Fallback
  }
}
