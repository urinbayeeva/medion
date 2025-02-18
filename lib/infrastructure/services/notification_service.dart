import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:medion/infrastructure/services/alice/alice.dart'; // Import Alice
import 'package:timezone/data/latest_all.dart' as tzd;
import 'package:timezone/timezone.dart' as tz;

import 'log_service.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final BuildContext _context;
  final Alice _alice; // Alice instance

  String darwinNotificationCategoryPlain = 'plainCategory';

  NotificationService._(
      this._context, this._flutterLocalNotificationsPlugin, this._alice);

  static NotificationService create({
    required BuildContext context,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    required Alice alice, // Require Alice instance
  }) {
    return NotificationService._(
        context, flutterLocalNotificationsPlugin, alice);
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
    _firebaseMessaging
        .getNotificationSettings()
        .then((value) => LogService.i(value.toString()));
  }

  void firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) {
      await _iosPermission();
    }

    _firebaseMessaging.getToken().then((token) {
      LogService.i("FCM Token: ${token ?? ""}");
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
      LogService.e('onBackgroundMessage data: ${message.data}');
      if (message.notification != null) {
        showNotification(
            id: DateTime.now().millisecond,
            title: message.notification!.title ?? "",
            body: message.notification!.body ?? "",
            payload: json.encode(message.data));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      LogService.e('onMessageOpenedApp data: ${message.data}');
      if (message.notification != null) {
        showNotification(
            id: DateTime.now().millisecond,
            title: message.notification!.title ?? "",
            body: message.notification!.body ?? "",
            payload: json.encode(message.data));
      }
    });
  }

  Future<void> notificationInit() async {
    await _firebaseMessaging.subscribeToTopic("all");

    await _configureLocalTimeZone();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse message) {
      LogService.i(message.payload ?? "");
      if (message.payload != null && message.payload!.isNotEmpty) {
        _handleAliceNotification(message.payload!);
      }
    }, onDidReceiveBackgroundNotificationResponse: _notificationTapBackground);

    _requestPermissions();
  }

  void _handleAliceNotification(String payload) {
    if (payload == "Alice") {
      _alice
          .showInspector(); // Open Alice Inspector if "Alice" payload is received
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
            sound: true,
          );
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
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
    LogService.i('Notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with payload: ${notificationResponse.payload}');
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    try {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails(
        'channel_id_5',
        'your channel name',
        icon: "ic_launcher",
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.max,
        ticker: 'ticker',
      );
      DarwinNotificationDetails iosNotificationDetails =
          DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
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
}
