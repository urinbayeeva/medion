import 'dart:async';
import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
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
        options.dsn = 'https://cd927ec80e2acd5006fb11c41b42a0ff@o482110.ingest.us.sentry.io/4508839849689088';
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
    Locale defaultLocale = const Locale('uz', 'UZ');
    try {
      String languageCode = Platform.localeName.split('_')[0];
      if (languageCode == "ru") {
        defaultLocale = const Locale('ru', 'RU');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    runApp(
      SentryWidget(
        child: EasyLocalization(
          supportedLocales: const [Locale('uz', 'UZ'), Locale('ru', 'RU')],
          path: 'assets/translation',
          startLocale: defaultLocale,
          fallbackLocale: const Locale('uz', 'UZ'),
          child: MyApp(
            dbService: AppInit.dbService!,
            connectivityX: AppInit.connectivityX!,
          ),
        ),
      ),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
