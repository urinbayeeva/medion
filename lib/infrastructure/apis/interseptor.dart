import 'dart:async';
import 'package:chopper/chopper.dart';

class CustomInterceptor implements Interceptor {
  const CustomInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    final request = chain.request;

    print('1***************************************************');
    print('📤 REQUEST → [${request.method}] ${request.url}');
    print('🔹 Headers: ${request.headers}');
    print('🔹 Body: ${request.body}');

    try {
      final response = await chain.proceed(request);

      if (!response.isSuccessful) {
        print('⚠️ NON-SUCCESS RESPONSE ← [${response.statusCode}] ${request.url}');
        print('🔹 Response Body: ${response.body}');
      } else {
        print('✅ SUCCESS RESPONSE ← [${response.statusCode}] ${request.url}');
        print('🔹 Response Body: ${response.body}');
      }

      print('2***************************************************');
      return response;
    } catch (error) {
      print('❌ EXCEPTION ↯ [${request.method}] ${request.url}');
      print('🔹 Headers: ${request.headers}');
      print('🔹 Body: ${request.body}');
      print('🔹 Error: $error');
      print('3***************************************************');
      rethrow;
    }
  }
}
