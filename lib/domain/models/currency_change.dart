import 'package:flutter/material.dart';

class CurrencyChangeProvider extends ChangeNotifier {
  bool _changeSum = false;

  bool get changeSum => _changeSum;

  void toggleChangeSum() {
    _changeSum = !_changeSum;
    notifyListeners();
  }
}
