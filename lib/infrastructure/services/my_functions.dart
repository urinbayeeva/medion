import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/pages/others/branches/widget/image_dialog.dart';
import 'package:medion/utils/enums/ads_enums.dart';
import 'package:medion/utils/enums/content_enum.dart';
import 'package:medion/utils/enums/feedback_status_enum.dart';
import 'package:medion/utils/enums/notification_type_enum.dart';
import 'package:medion/utils/enums/visits_enum.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'hermony_os_checker.dart';
import 'package:dio/dio.dart';

class Times {
  final String time;
  final String date;

  const Times({this.time = '', this.date = ''});
}

sealed class MyFunctions {
  static Future<String?> videoContentType(String url) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        url,
        options: Options(
          followRedirects: true,
          responseType: ResponseType.stream,
        ),
      );

      final contentType = response.headers.value('content-type');
      print('Dio --- Content-Type: $contentType');
      print('Dio --- Content-Status code: ${response.statusCode}');
      print('Dio --- Content-Data: ${response.data.runtimeType}');
      return contentType;
    } catch (e) {
      print('Dio --- Error fetching content-type via GET: $e');
      return null;
    }
  }

  static int generateDigitCode({int length = 6}) {
    final random = Random();
    final int min = pow(10, length - 1).toInt();
    final int max = pow(10, length).toInt();
    return min + random.nextInt(max - min);
  }

  static Future<File?> downloadVideo({required String url}) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );

      if (response.statusCode == null && response.statusCode! > 210 && response.statusCode! < 199) {
        debugPrint("❌ Download failed: ${response.statusCode}");
        return null;
      }

      final directory = await _getDownloadsDirectory();
      final appDir = Directory("${directory.path}/Medion");

      if (!await appDir.exists()) {
        await appDir.create(recursive: true);
      }

      final rand = generateDigitCode();
      final fileName = 'downloaded_video_$rand.mp4';
      final filePath = "${appDir.path}/$fileName";

      final file = File(filePath);
      await file.writeAsBytes(response.data);

      debugPrint("✅ File saved at: $filePath");
      return file;
    } catch (e) {
      debugPrint("❌ Error downloading video: $e");
      return null;
    }
  }

  static Future<Directory> _getDownloadsDirectory() async {
    if (Platform.isAndroid) {
      return Directory('/storage/emulated/0/Download');
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String _extensionFromContentType(String contentType) {
    switch (contentType) {
      case 'video/mp4':
        return 'mp4';
      case 'video/x-matroska':
        return 'mkv';
      case 'video/quicktime':
        return 'mov';
      case 'video/avi':
      case 'video/x-msvideo':
        return 'avi';
      default:
        return 'mp4'; // fallback
    }
  }

  // static Future<String?> videoContentType(String url) async {
  //   try {
  //     final dio = Dio();
  //
  //     final response = await dio.head(
  //       url,
  //       options: Options(followRedirects: true),
  //     );
  //
  //     final contentType = response.headers.value('content-type');
  //
  //     log('Dio --- Content-Type: $contentType');
  //     return contentType;
  //   } catch (e) {
  //     log('Dio --- Error fetching content-type: $e');
  //     return null;
  //   }
  // }

  static void showImages({
    required BuildContext context,
    required String mainImage,
    required bool isVideo,
    double height = 218,
    double width = 343,
    required List<ContentBase> images,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return ImageDialog(
          mainImage: mainImage,
          images: images,
          height: height,
          width: width,
          isVideo: isVideo,
        );
      },
    );
  }

  static void shareData(Map<String, dynamic> data) {
    final buffer = StringBuffer();
    data.forEach((key, value) {
      buffer.writeln('$key: $value');
    });

    Share.share(buffer.toString());
  }

  static Times changeTime(String value) {
    DateTime parsedDate = DateFormat("dd-MM-yyyy HH:mm:ss").parse(value);

    String date = DateFormat("dd-MM-yyyy").format(parsedDate);
    String time = DateFormat("HH:mm:ss").format(parsedDate);

    return Times(date: date, time: time);
  }

  static NotificationTypeEnum getNotificationType(String? status) {
    return NotificationTypeEnum.values.firstWhere(
      (e) => e.keyWord == status,
      orElse: () => NotificationTypeEnum.all,
    );
  }

  static ContentEnum getContentType(String? status) {
    return ContentEnum.values.firstWhere(
      (e) => e.name == status,
      orElse: () => ContentEnum.equipments,
    );
  }

  static AdsEnum findAdsType(String? status) {
    return AdsEnum.values.firstWhere(
      (e) => e.name == status,
      orElse: () => AdsEnum.none,
    );
  }

  static FeedBackStatus getFeedBackStatus(String? status) {
    return FeedBackStatus.values.firstWhere(
      (e) => e.ipKey == status,
      orElse: () => FeedBackStatus.none,
    );
  }

  static VisitListEnum getVisitStatus(String? status) {
    return VisitListEnum.values.firstWhere(
      (e) => e.name == status,
      orElse: () => VisitListEnum.ordered,
    );
  }

  static Future<void> openLink(String url, {LaunchMode mode = LaunchMode.externalApplication}) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: mode);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String formattedDate(String date) {
    try {
      final dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      final parsedDate = dateFormat.parse(date);
      return DateFormat('d MMMM yyyy, HH:mm').format(parsedDate);
    } catch (e) {
      debugPrint('Error formatting date: $e');
      return date;
    }
  }

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
      debugPrint("DEVICE ID ==> $uDid ");
    } catch (e) {
      debugPrint("DEVICE ID ERROR ==> $e ");
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

    debugPrint('\n');
    debugPrint('==================================================================================');
    debugPrint('******** DEVICE INFO ********');
    debugPrint('### deviceName: $deviceName');
    debugPrint('### userAgent: $userAgent');
    debugPrint('### deviceType: $platform');
    debugPrint('### appVersion: $appVersion');
    debugPrint('==================================================================================\n');
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
