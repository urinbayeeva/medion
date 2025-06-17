import 'dart:async';
import 'package:chopper/chopper.dart';

class RetryInterceptor implements Interceptor {
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor({this.maxRetries = 3, this.retryDelay = const Duration(seconds: 2)});

  @override
  FutureOr<Response<T>> intercept<T>(Chain<T> chain) async {
    final request = chain.request;
    for (int attempt = 0; attempt < maxRetries; attempt++) {
      try {
        return chain.proceed(request);
      } catch (e) {
        if (attempt < maxRetries - 1) {
          await Future.delayed(retryDelay);
        } else {
          rethrow;
        }
      }
    }
    return chain.proceed(request);
  }
}
