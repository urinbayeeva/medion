import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  static ValueNotifier<int> unReadNotifyCountNotifier = ValueNotifier<int>(0);
  static final StreamController<int> _notificationStreamController = StreamController.broadcast(sync: true);

  static late FirebaseMessaging messaging;
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
      "high importance channel", "High importance Notifications",
      description: "This channel is used for important notifications", importance: Importance.max);

  static Stream<int> notificationStream() async* {
    yield* _notificationStreamController.stream;
  }

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    debugPrint('==== messagemessage data: ${message.data}');
    debugPrint('==== messagemessage title: ${message.notification?.title}');
    debugPrint('==== messagemessage body: ${message.notification?.body}');
    _notificationStreamController.add(1);
  }

  static Future<void> resolvePlatformSpecificImplementationAndroid() async {
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
  }

  static Future<void> setForegroundNotificationPresentationOptions() async => await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

  static Future<void> messagingRequestPermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<void> configurationFirebaseNotification() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await resolvePlatformSpecificImplementationAndroid();

    messaging = FirebaseMessaging.instance;
    await setForegroundNotificationPresentationOptions();
    await messagingRequestPermission();
  }

  static void initializeFlutterLocalNotificationsPlugin(BuildContext context, [int? sdkV]) {
    final initializationSettingsAndroid = sdkV != null && sdkV >= 31
        ? const AndroidInitializationSettings('@mipmap/ic_launcher')
        : const AndroidInitializationSettings('@drawable/logo_bg');

    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void listenFireBaseOnMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        _notificationStreamController.add(1);

        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            1,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: 'ic_launcher',
                importance: Importance.max,
                priority: Priority.max,
                color: Colors.red,
              ),
            ),
          );
        }
      },
      onError: (error) {
        debugPrint("Error in receiving message: $error");
      },
    );
  }

  static void initializeAndListenFirebaseMessaging(BuildContext context, [int? sdk]) async {
    debugPrint('call initializeAndListenFirebaseMessaging');
    initializeFlutterLocalNotificationsPlugin(context, sdk);
    configurationFirebaseNotification();
    listenFireBaseOnMessage();
  }
}
