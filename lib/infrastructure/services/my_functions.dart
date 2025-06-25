import 'dart:developer';
import 'dart:io';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:google_api_availability/google_api_availability.dart';

import 'hermony_os_checker.dart';

sealed class MyFunctions {
  static Future<String> get currentVersionAsync async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    // await StorageRepository.putString(StoreKeys.currentAppVersion, currentVersion);
    return currentVersion;
  }

  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }

  static Future<String?> getDeviceName(DeviceInfoPlugin deviceInfo) async {
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.name;
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return "${androidDeviceInfo.brand} ${androidDeviceInfo.model}";
    }
    return null;
  }

  static Future<String?> getUserAgent(DeviceInfoPlugin deviceInfo) async {
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.utsname.machine;
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.model;
    }
    return null;
  }

  static Future<void> initDeviceInfo(DBService service) async {
    try {
      final uDid = await FlutterUdid.udid;
      await service.setUid(uDid);
      log("DEVICE ID ==> $uDid ");
    } catch (e) {
      log("DEVICE ID ERROR ==> $e ");
    }
    final deviceInfo = DeviceInfoPlugin();
    final deviceName = await getDeviceName(deviceInfo);
    final userAgent = await getUserAgent(deviceInfo);
    final appVersion = await getAppVersion();
    final platform = await getPlatform();
    await service.setDeviceName(deviceName ?? '');
    await service.setUserAgent(userAgent ?? '');
    await service.setVersion(appVersion);
    await service.setPlatform(platform);

    log('\n');
    log('==================================================================================');
    log('******** DEVICE INFO ********');
    log('### deviceName: $deviceName');
    log('### userAgent: $userAgent');
    log('### deviceType: $platform');
    log('### appVersion: $appVersion');
    log('==================================================================================\n');
  }

  static Future<String> getPlatform() async {
    if (Platform.isIOS) {
      return "IOS";
    }
    if (Platform.isMacOS) {
      return "MACOS";
    }
    final googlePlayAvailability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();
    final isHarmonyOS = await HarmonyOsChecker.isHarmonyOS();
    if (isHarmonyOS &&
        (googlePlayAvailability == GooglePlayServicesAvailability.notAvailableOnPlatform ||
            googlePlayAvailability == GooglePlayServicesAvailability.serviceDisabled ||
            googlePlayAvailability == GooglePlayServicesAvailability.serviceInvalid)) {
      return "HARMONY_OS";
    }
    return "ANDROID";
  }
}
