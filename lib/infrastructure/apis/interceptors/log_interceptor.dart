import 'dart:async';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'dart:developer';
import 'package:chopper/chopper.dart';

class LogInterceptor implements Interceptor {
  const LogInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    final request = chain.request;

    log('\n\n1***************************************************');
    log('📤 REQUEST → [${request.method}] ${request.url}');
    log('🔹 REQUEST Headers: ${request.headers}');
    log('🔹 REQUEST Body: ${request.body}');

    try {
      final response = await chain.proceed(request);

      if (!response.isSuccessful) {
        log('⚠️ NON-SUCCESS RESPONSE ← [${response.statusCode}] ${request.url}');
        log('🔹 Response Body: ${response.body}');
      } else {
        log('✅ SUCCESS RESPONSE ← [${response.statusCode}] ${request.url}');
        log('🔹 Response Body: ${response.body}');
      }

      log('\n\n2***************************************************\n\n');
      return response;
    } catch (error) {
      log('❌ EXCEPTION ↯ [${request.method}] ${request.url}');
      log('🔹 Headers: ${request.headers}');
      log('🔹 Body: ${request.body}');
      log('🔹 Error: $error');
      log('\n\n3***************************************************\n\n');
      rethrow;
    }
  }
}
