// import 'dart:io';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
// import 'package:medion/infrastructure/connectivity.dart';
// import 'package:medion/infrastructure/services/local_database/db_service.dart';
// import 'package:medion/infrastructure/services/log_service.dart';
// import 'package:medion/main.dart';

// class AppInit {
//   static bool? connectivityX;
//   static DBService? dbService;

//   AppInit._();

//   static Future<AppInit> get create async {
//     await appInitialized();
//     connectivityX ??= await ConnectivityX().create();
//     dbService ??= await DBService.create;
//     return AppInit._();
//   }

//   static Future<void> appInitialized() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Hive.initFlutter();

//     // Initialize Firebase
//     try {
//       await Firebase.initializeApp();
//       print("Firebase initialized successfully");
//     } catch (e) {
//       print("Error initializing Firebase: $e");
//     }

//     // LogService Create
//     LogService.create;

//     // Device Orientation
//     await SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

//     if (kDebugMode) {
//       Bloc.observer = LogBlocObserver();
//     }
//     HttpOverrides.global = MyHttpOverrides();
//     await ScreenUtil.ensureScreenSize();
//   }
// }
