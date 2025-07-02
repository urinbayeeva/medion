import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:medion/infrastructure/core/exceptions.dart';
import 'package:medion/infrastructure/services/connectivity.dart';

class NetworkInterceptor implements Interceptor {
  @override
  FutureOr<Response<T>> intercept<T>(Chain<T> chain) async {
    final connectivity = await ConnectivityX().create();

    if (!connectivity) {
      throw NetworkException();
    }
    return chain.proceed(chain.request);
  }
}
