import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/un_focus_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';

import 'package:medion/utils/app_config.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyApp extends StatelessWidget {
  final DBService dbService;
  final bool connectivityX;
  final Function(BuildContext context)? onGetContext;
  const MyApp({
    super.key,
    required this.dbService,
    required this.connectivityX,
    this.onGetContext,
  });

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => GlobalController.create(dbService)),
          ChangeNotifierProvider(
              create: (_) => BottomNavBarController.create()),
          Provider<DBService>(create: (_) => dbService),
        ],
        child: OnUnFocusTap(
          child: MaterialApp(
            // navigatorKey: alice.getNavigatorKey(),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              child = FlutterSmartDialog.init()(context, child);
              return FlavorBanner(
                child: child,
              );
            },
            navigatorObservers: [
              FlutterSmartDialog.observer,
              // AnalyticsService().getAnalyticsObserver(),
              SentryNavigatorObserver(),
            ],
            onGenerateRoute: (_) {
              if (onGetContext != null) {
                onGetContext!(context);
              }
              return AppRoutes.getOnBoardingPage(context: context);
            },
          ),
        ));
  }
}

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (AppConfig.shared.flavor == Flavor.prod) {
      return child;
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        _buildBanner(context),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Banner(
      message: AppConfig.shared.flavor.name,
      location: BannerLocation.topStart,
    );
  }
}
