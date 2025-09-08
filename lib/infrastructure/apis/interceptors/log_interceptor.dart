import 'dart:async';
import 'dart:developer';
import 'package:chopper/chopper.dart';
import 'package:medion/infrastructure/core/exceptions.dart';

class LogInterceptor implements Interceptor {
  const LogInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    final request = chain.request;
    Response<BodyType>? response;

    log('\n\n🟡 [REQUEST] → [${request.method}] ${request.url}');
    log('🔹 Headers: ${request.headers}');
    log('🔹 Body: ${request.body}');
    log('🔹 Query: ${request.parameters}');

    try {
      response = await chain.proceed(request);

      if (!response.isSuccessful) {
        log('⚠️ NON-SUCCESS RESPONSE ← [${response.statusCode}] ${request.url}');
        log('🔹 Response Body: ${response.body}');
      } else {
        log('✅ SUCCESS RESPONSE ← [${response.statusCode}] ${request.url}');
        log('🔹 Response Body: ${response.body}');
      }

      log('🟢 [REQUEST END]\n');
      return response;
    } catch (error) {
      log('❌ EXCEPTION ↯ [${request.method}] ${request.url}');
      log('🔹 Headers: ${request.headers}');
      log('🔹 Body: ${request.body}');
      log('🔹 Error: $error');
      log('🔹 Response Error : ${(error as BackendExceptionForSentry).response.error}');
      log('🔹 Error Response Body: ${(error).response.body}');
      log('🔹 Error Response BodyString: ${(error).response.bodyString}');

      log('🔴 [EXCEPTION END]\n');
      rethrow;
    }
  }
}
