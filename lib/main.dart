import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/core/app_init.dart';
import 'package:medion/presentation/pages/core/my_app.dart';
import 'package:medion/utils/app_config.dart';
import 'package:medion/utils/constants.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await AppInit.create;

  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  HttpOverrides.global = MyHttpOverrides();
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://3d72ba29f0b24f93e06cddd7b7273a56@o4508238845575168.ingest.us.sentry.io/4508238847672320';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MyApp(
                dbService: AppInit.dbService!,
                connectivityX: AppInit.connectivityX!,
              ))),
    );
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      Sentry.captureException(details.exception, stackTrace: details.stack);
    };
    AppConfig.create(
      appName: Constants.appName,
      baseUrl: Constants.baseUrlP,
      primaryColor: Colors.yellow,
      flavor: Flavor.prod,
    );
    await AppInit.create;
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

/// bloc logger
class LogBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print("\n----------$bloc Changed-----------\n");
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print("$bloc closed---------------------");
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print("$bloc created---------------------");
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      LogService.d('---------Event------------${bloc.runtimeType} $event');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print('---------Error------------${bloc.runtimeType} $error');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print("--------------$bloc Transition---------------------");
    }
  }
}

/// ssl
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
