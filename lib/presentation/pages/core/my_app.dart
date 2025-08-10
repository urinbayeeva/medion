import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/application/locale_bloc/locale_bloc.dart';
import 'package:medion/application/notification/notification_bloc.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/application/service_page_provider.dart';
import 'package:medion/application/services/time_select_provider.dart';
import 'package:medion/application/visit/visit_bloc.dart';
import 'package:medion/domain/abstract_repo/notification/notification_repository.dart';
import 'package:medion/domain/models/currency_change.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/core/interceptors.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/repository/booking_repository.dart';
import 'package:medion/infrastructure/repository/branch_repo.dart';
import 'package:medion/infrastructure/repository/company_service.dart';
import 'package:medion/infrastructure/repository/content_service.dart';
import 'package:medion/infrastructure/repository/doctor_repository.dart';
import 'package:medion/infrastructure/repository/home_repo.dart';
import 'package:medion/infrastructure/repository/notification_repo_impl.dart';
import 'package:medion/infrastructure/repository/visit_create_repo.dart';
import 'package:medion/infrastructure/services/alice/alice.dart';
import 'package:medion/infrastructure/services/alice/model/alice_configuration.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/un_focus_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/app_config.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final AliceChopperAdapter aliceChopperAdapter = AliceChopperAdapter();
Alice alice = Alice(
  configuration: AliceConfiguration(showNotification: true, showInspectorOnShake: false),
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
        Provider<DBService>(create: (_) => dbService),
        // ChangeNotifierProvider(create: (_) => SelectedServicesProvider()),
        // ChangeNotifierProvider(create: (_) => SelectedServiceIdsProvider()),
        // ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => TimeSelectionProvider()),
        ChangeNotifierProvider(create: (_) => CurrencyChangeProvider()),
        ChangeNotifierProvider(create: (_) => ServicesPageProvider()),
        BlocProvider(create: (context) => LocaleBloc()..add(const LocaleEvent.initialize()), lazy: false),
        BlocProvider(create: (context) => HomeBloc(HomeRepository(HomePageService.create(dbService)))),
        BlocProvider(create: (context) => VisitBloc(VisitRepository(VisitCreateService.create(dbService)))),
        ChangeNotifierProvider(create: (_) => GlobalController.create(dbService)),
        ChangeNotifierProvider(create: (_) => BottomNavBarController.create()),
        BlocProvider(create: (context) => DoctorBloc(DoctorRepository(DoctorService.create(dbService)))),
        BlocProvider(
          create: (context) => ContentBloc(
            ContentServiceRepo(ContentService.create(dbService)),
            CompanyServiceRepo(CompanyService.create(dbService)),
          ),
        ),
        BlocProvider(
          create: (context) => BranchBloc(
            BranchRepository(
              BranchService.create(dbService),
              StudyService.create(dbService),
              CompanyService.create(dbService),
            ),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthRepository(
              dbService,
              AuthService.create(dbService),
              PatientService.create(dbService),
              RefreshService.create(dbService),
            ),
            dbService,
          )
            ..add(const AuthEvent.checkAuth())
            ..add(const AuthEvent.fetchPatientInfo()),
        ),
        BlocProvider<BookingBloc>(
          create: (context) => BookingBloc(
            BookingRepository(BookingService.create(dbService)),
          ),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(
            NotificationRepoImpl(service: NotificationService.create(dbService)),
            dbService,
          ),
        ),
      ],
      child: OnUnFocusTap(
        child: BlocProvider<ProfileBloc>(
          create: (_) => ProfileBloc(),
          child: MaterialApp(
            navigatorKey: alice.getNavigatorKey(),
            debugShowCheckedModeBanner: kDebugMode,
            builder: (context, child) {
              child = FlutterSmartDialog.init()(context, child);
              return FlavorBanner(child: child);
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
              log("Languageee: ${dbService.getLang}");

              if (onGetContext != null) {
                onGetContext!(context);
              }
              return AppRoutes.onGenerateRoute(
                context: context,
                notConnection: !connectivityX,
                isLang: dbService.getLang ?? true,
              );
            },
          ),
        ),
      ),
    );
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
