import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  String? _paymeUrl;
  String? _clickUrl;
  String? _multiUrl;

  String? get paymeUrl => _paymeUrl;
  String? get clickUrl => _clickUrl;
  String? get multiUrl => _multiUrl;

  void setPaymentUrls(String paymeUrl, String clickUrl, String multiUrl) {
    _paymeUrl = paymeUrl;
    _clickUrl = clickUrl;
    _multiUrl = multiUrl;
    notifyListeners();
  }
}
