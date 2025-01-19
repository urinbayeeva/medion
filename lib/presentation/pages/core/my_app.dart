import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/core/interceptors.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/repository/booking_repository.dart';
import 'package:medion/infrastructure/repository/home_repo.dart';
import 'package:medion/infrastructure/repository/image_upload_repo.dart';
import 'package:medion/infrastructure/services/alice/model/alice_configuration.dart';
import 'package:medion/infrastructure/services/alice/alice.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/un_focus_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';

import 'package:medion/utils/app_config.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final AliceChopperAdapter aliceChopperAdapter = AliceChopperAdapter();
Alice alice = Alice(
  configuration: AliceConfiguration(
    showNotification: true,
    showInspectorOnShake: true,
  ),
)..addAdapter(aliceChopperAdapter);

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
          BlocProvider(
              create: (context) =>
                  HomeBloc(HomeRepository(HomePageService.create(dbService)))),
          BlocProvider<BookingBloc>(
            create: (context) => BookingBloc(
                BookingRepository(BookingService.create(dbService))),
          ),
          ChangeNotifierProvider(
              create: (_) => GlobalController.create(dbService)),
          ChangeNotifierProvider(
              create: (_) => BottomNavBarController.create()),
          Provider<DBService>(create: (_) => dbService),
        ],
        child: OnUnFocusTap(
          child: BlocProvider<ProfileBloc>(
              create: (_) => ProfileBloc(
                    AuthRepository(dbService, AuthService.create(dbService),
                        PatientService.create(dbService)),
                    ImageUploadRepo(UploadImage.create(dbService)),
                  ),
              child: MaterialApp(
                navigatorKey: alice.getNavigatorKey(),
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
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                onGenerateRoute: (_) {
                  if (onGetContext != null) {
                    onGetContext!(context);
                  }
                  return AppRoutes.onGenerateRoute(
                    context: context,
                    notConnection: !connectivityX,
                    isLang: dbService.getLang ?? true,
                  );
                },
              )),
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
