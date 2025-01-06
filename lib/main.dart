import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:medion/presentation/pages/core/app_init.dart';
import 'package:medion/presentation/pages/core/my_app.dart';
import 'package:medion/utils/app_config.dart';
import 'package:medion/utils/constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sentry_flutter/sentry_flutter.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await AppInit.create;
  await initializeDateFormatting('ru', null);

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
    Locale defaultLocale = const Locale('uz', 'UZ');

    try {
      String languageCode = Platform.localeName.split('_')[0];
      if (languageCode == "ru") {
        defaultLocale = const Locale('ru', 'RU');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    runApp(EasyLocalization(
      supportedLocales: const [Locale('uz', 'UZ'), Locale('ru', 'RU')],
      path: 'assets/translation',
      startLocale: defaultLocale,
      fallbackLocale: const Locale('uz', 'UZ'),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MyApp(
          dbService: AppInit.dbService!,
          connectivityX: AppInit.connectivityX!,
        ),
      ),
    ));
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
