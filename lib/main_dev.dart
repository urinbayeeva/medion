import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:medion/presentation/core/app_init.dart';
import 'package:medion/presentation/pages/core/my_app.dart';
import 'package:medion/utils/app_config.dart';
import 'package:medion/utils/constants.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://98080372fc6d9a2948f754f1600ae393@o4507768261246976.ingest.de.sentry.io/4507768799494224';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
    );
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      Sentry.captureException(details.exception, stackTrace: details.stack);
    };
    AppConfig.create(
      appName: Constants.appNameDev,
      baseUrl: Constants.baseUrlP,
      primaryColor: Colors.red,
      flavor: Flavor.dev,
    );
    await AppInit.create;

    runApp(
      SentryWidget(
        child: MyApp(
          dbService: AppInit.dbService!,
          connectivityX: AppInit.connectivityX!,
        ),
      ),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
