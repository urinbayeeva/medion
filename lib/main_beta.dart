import 'dart:async';

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
            'https://cd927ec80e2acd5006fb11c41b42a0ff@o482110.ingest.us.sentry.io/4508839849689088';
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
    AppConfig.create;

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
