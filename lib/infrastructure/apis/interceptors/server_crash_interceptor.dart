import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:medion/infrastructure/core/exceptions.dart';

class BackendInterceptor implements Interceptor {
  @override
  FutureOr<Response<T>> intercept<T>(Chain<T> chain) async {
    final response = await chain.proceed(chain.request);
    if (response.statusCode >= 500) {
      throw BackendException();
    }
    return response;
  }
}
