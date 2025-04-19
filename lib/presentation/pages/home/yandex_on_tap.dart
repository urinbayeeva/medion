import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

void launchYandexTaxi(
    BuildContext context, double endLat, double endLon) async {
  // Foydalanuvchining hozirgi joylashuvini olish
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  final startLat = position.latitude;
  final startLon = position.longitude;

  final url =
      'https://3.redirect.appmetrica.yandex.com/route?start-lat=$startLat&start-lon=$startLon&end-lat=$endLat&end-lon=$endLon';

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Yandex Taxi ochib bo‘lmadi')));
  }
}
