import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:medion/presentation/pages/core/app_init.dart';
import 'package:medion/presentation/pages/core/my_app.dart';
import 'package:medion/utils/app_config.dart';
import 'package:medion/utils/constants.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://093642f75fe25d9ee81c4ed7c65c86b2@o4507768261246976.ingest.de.sentry.io/4507768815616080';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
    );
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      Sentry.captureException(details.exception, stackTrace: details.stack);
    };
    AppConfig.create(
      appName: Constants.appNameBeta,
      baseUrl: Constants.baseUrlP,
      primaryColor: Colors.green,
      flavor: Flavor.beta,
    );
    await AppConfig.create;

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
