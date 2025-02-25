// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:medion/application/profile/profile_bloc.dart';

import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/pages/core/my_app.dart';

import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/app_config.dart';
import 'package:medion/utils/constants.dart';
import 'package:timezone/data/latest_all.dart' as tzd;
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final BuildContext _context;
  String darwinNotificationCategoryPlain = 'plainCategory';

  NotificationService._(this._context, this._flutterLocalNotificationsPlugin);

  static NotificationService create({
    required BuildContext context,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) {
    return NotificationService._(context, flutterLocalNotificationsPlugin);
  }

  Future<void> _iosPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
    _firebaseMessaging
        .getNotificationSettings()
        .then((value) => LogService.i(value.toString()));
  }

  void firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) {
      await _iosPermission();
    }

    _firebaseMessaging.getToken().then((token) {
      LogService.i("fcm token  ${token ?? ""}");
      // authRepository.setFCMToken(FCMTokenModel((p0) => p0..fcmToken = token));
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LogService.i(
          'Message data: ${message.notification?.toMap()} ${message.data}');

      if (message.notification != null) {
        showNotification(
            id: DateTime.now().millisecond,
            title: message.notification!.title ?? "",
            body: message.notification!.body ?? "",
            payload: json.encode(message.data));
      }
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      LogService.e(' onBackgroundMessageMessage data: ${message.data}');
      if (message.notification != null) {
        LogService.e(
            'onBackgroundMessage Message also contained a notification: ${message.notification}');
        showNotification(
            id: DateTime.now().millisecond,
            title: message.notification!.title ?? "",
            body: message.notification!.body ?? "",
            payload: json.encode(message.data));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      LogService.e(' onMessageOpenedApp data: ${message.data}');
      if (message.notification != null) {
        LogService.e(
            'onMessageOpenedApp Message also contained a notification: ${message.notification}');
        showNotification(
            id: DateTime.now().millisecond,
            title: message.notification!.title ?? "",
            body: message.notification!.body ?? "",
            payload: json.encode(message.data));
      }
    });
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      handleMessage(initialMessage.data['deeplink']);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp
        .listen((r) => handleMessage(r.data['deeplink']));
  }

  notificationInit() async {
    await _firebaseMessaging.subscribeToTopic("all");

    /// notification
    await _configureLocalTimeZone();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        !kIsWeb && Platform.isLinux
            ? null
            : await _flutterLocalNotificationsPlugin
                .getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {}

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final List<DarwinNotificationCategory> darwinNotificationCategories =
        <DarwinNotificationCategory>[
      DarwinNotificationCategory(
        "textCategory",
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.text(
            'text_1',
            'Action 1',
            buttonTitle: 'Send',
            placeholder: 'Placeholder',
          ),
        ],
      ),
      DarwinNotificationCategory(
        "plainCategory",
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.plain('id_1', 'Action 1'),
          DarwinNotificationAction.plain(
            'id_2',
            'Action 2 (destructive)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.destructive,
            },
          ),
          DarwinNotificationAction.plain(
            "id_3",
            'Action 3 (foreground)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.foreground,
            },
          ),
          DarwinNotificationAction.plain(
            'id_4',
            'Action 4 (auth required)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.authenticationRequired,
            },
          ),
        ],
        options: <DarwinNotificationCategoryOption>{
          DarwinNotificationCategoryOption.allowAnnouncement,
        },
      )
    ];

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      notificationCategories: darwinNotificationCategories,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(
      defaultActionName: 'Open notification',
      defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse message) {
      LogService.i(message.payload ?? "");
      if (message.payload != null && message.payload!.isNotEmpty) {
        if (AppConfig.shared.flavor == Flavor.dev &&
            message.payload == "Alice") {
          alice.showInspector();
          return;
        }
        try {
          Map<String, dynamic> map = json.decode(message.payload ?? "{}");
          handleMessage(map['deeplink']);
        } catch (e) {
          LogService.e(e.toString());
        }
      } else {}
    }, onDidReceiveBackgroundNotificationResponse: _notificationTapBackground);
    _isAndroidPermissionGranted();
    _requestPermissions();
  }

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            critical: true,
            provisional: true,
            sound: true,
          );
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
              provisional: true,
              critical: true);
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.checkPermissions()
          .then((value) {
        // LogService.i(value);
      });
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>();

      await androidImplementation?.requestNotificationsPermission();
    }
  }

  static Future<void> _configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tzd.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  @pragma('vm:entry-point')
  static void _notificationTapBackground(
      NotificationResponse notificationResponse) {
    LogService.i('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
    if (notificationResponse.input?.isNotEmpty ?? false) {
      LogService.i(
          'notification action tapped with input: ${notificationResponse.input}');
    }
  }

  Future<void> showNotification(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    try {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails(
        'channel_id_5',
        'your channel name',
        icon: "ic_launcher",
        // sound: RawResourceAndroidNotificationSound('custom_sound'),
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.max,
        ticker: 'ticker',
      );
      DarwinNotificationDetails iosNotificationDetails =
          DarwinNotificationDetails(
        presentAlert: true,
        // sound: 'custom_sound.aiff',
        presentBadge: true,
        presentSound: true,
        presentBanner: true,
        presentList: true,
        threadIdentifier: 'thread_id',
        categoryIdentifier: darwinNotificationCategoryPlain,
      );

      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: iosNotificationDetails);
      await _flutterLocalNotificationsPlugin
          .show(id, title, body, notificationDetails, payload: payload);
    } catch (e) {
      LogService.e(e.toString());
    }
  }

  /// Handle Message
  void handleMessage(String? url, {bool updateMessages = true}) {
    bool navBar = _context.read<BottomNavBarController>().hiddenNavBar;
    LogService.i("_handleMessage $url");
    if (url != null) {
      Uri uri = Uri.parse(url);
      List<String> segments = uri.pathSegments;
      String? lastSegment = segments.lastOrNull;

      if (segments.contains('profile')) {
        // Navigator.of(_context, rootNavigator: true)
        //     .push(AppRoutes.getProfile(_context, true));
      }
      if (segments.contains('auction_offers') && lastSegment != null) {
        int? id = int.tryParse(lastSegment);
        if (id != null) {
          // Navigator.push(_context, AppRoutes.getBuyoutDetail(_context, id))
          //     .then((_) {
          //   _context.read<BottomNavBarController>().changeNavBar(navBar);
          // });
        }
      }

      if (segments.contains('my_auction_detail') && lastSegment != null) {
        int? id = int.tryParse(lastSegment);
        if (id != null) {
          _context.read<BottomNavBarController>().changeNavBar(true);
          // Navigator.push(_context, AppRoutes.getBuyoutBusinessDetail(id))
          //     .then((_) {
          //   _context.read<BottomNavBarController>().changeNavBar(navBar);
          // });
        }
      }

      if (segments.contains('auction') && lastSegment != null) {
        bool isBusiness =
            _context.read<DBService>().getBool(key: DBService.business) ??
                false;
        if (isBusiness) {
          int? id = int.tryParse(lastSegment);
          if (id != null) {
            _context.read<BottomNavBarController>().changeNavBar(true);
            // Navigator.push(
            //         _context,
            //         AppRoutes.getProductCard(
            //             model: CarPostModel((p0) => p0..id = id),
            //             isAuction: true,
            //             isOffer: false,
            //             isMine: false))
            //     .then((_) {
            //   _context.read<BottomNavBarController>().changeNavBar(navBar);
            // });
          }
        } else {
          _context.read<BottomNavBarController>().changeNavBar(true);
          // Navigator.push(
          //         _context,
          //         AppRoutes.getWebView(
          //             "https://a-bozor.uz/webview/abozor-ai-bot"))
          //   .then((_) {
          // _context.read<BottomNavBarController>().changeNavBar(navBar);
        }
      }
    }
  }
}
