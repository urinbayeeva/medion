import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

Future<void> launchYandexTaxi(BuildContext context, double endLat, double endLon) async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Joylashuv xizmatlari o‘chirilgan'.tr())));
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Joylashuv ruxsatlari talab qilinadi'.tr())));
        return;
      }
    }

    if (endLat == 0.0 && endLon == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Noto‘g‘ri manzil koordinatalari'.tr())));
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final url = Uri.parse(
        'yandex.taxi://route?start-lat=${position.latitude}&start-lon=${position.longitude}&end-lat=$endLat&end-lon=$endLon');

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      final fallbackUrl = Uri.parse(
          'https://taxi.yandex.com/#order?from=${position.latitude},${position.longitude}&to=$endLat,$endLon');
      if (await canLaunchUrl(fallbackUrl)) {
        await launchUrl(
          fallbackUrl,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Yandex Taxi ochilmadi';
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Xato: ${e.toString()}'.tr())));
  }
}

// Future<void> launchYandexTaxi(BuildContext context, double endLat, double endLon) async {
//   try {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location services are disabled')));
//       return;
//     }
//
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are required')));
//         return;
//       }
//     }
//
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//     final url = Uri.parse(
//         'https://3.redirect.appmetrica.yandex.com/route?start-lat=${position.latitude}&start-lon=${position.longitude}&end-lat=$endLat&end-lon=$endLon&app=com.yandex.taxi');
//
//     if (await canLaunchUrl(url)) {
//       await launchUrl(
//         url,
//         mode: LaunchMode.externalApplication,
//       );
//     } else {
//       final fallbackUrl = Uri.parse(
//           'https://taxi.yandex.com/?from=ll~${position.latitude}~${position.longitude}&to=ll~$endLat~$endLon');
//       if (await canLaunchUrl(fallbackUrl)) {
//         await launchUrl(fallbackUrl);
//       } else {
//         throw 'Could not launch Yandex Taxi';
//       }
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
//   }
// }
