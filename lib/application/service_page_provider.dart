// services_page_provider.dart
import 'package:flutter/material.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';

class ServicesPageProvider extends ChangeNotifier {
  final List<Service> _selectedServices = [];
  final List<int> _selectedServiceIds = [];

  List<Service> get selectedServices => _selectedServices;

  List<int> get selectedServiceIds => _selectedServiceIds;

  int get selectedCount => _selectedServices.length;

  void toggleService(Service service) {
    if (_selectedServiceIds.contains(service.id)) {
      _selectedServiceIds.remove(service.id);
      _selectedServices.removeWhere((s) => s.id == service.id);
    } else {
      _selectedServiceIds.add(service.id!);
      _selectedServices.add(service);
    }
    notifyListeners();
  }

  void clearSelection() {
    _selectedServices.clear();
    _selectedServiceIds.clear();
    notifyListeners();
  }

  bool isSelected(Service service) {
    return _selectedServiceIds.contains(service.id);
  }
}
