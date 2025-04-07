import 'package:flutter/material.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';

class SelectedServicesProvider extends ChangeNotifier {
  final List<Service> _selectedServices = [];

  List<Service> get selectedServices => _selectedServices;

  void addService(Service service) {
    if (!_selectedServices.contains(service)) {
      _selectedServices.add(service);
      notifyListeners();
    }
  }

  void removeService(Service service) {
    _selectedServices.remove(service);
    notifyListeners();
  }

  // Added method to clear all services
  void clearServices() {
    _selectedServices.clear();
    notifyListeners();
  }
}

class SelectedServiceIdsProvider with ChangeNotifier {
  List<int> _selectedServiceIds = [];

  List<int> get selectedServiceIds => _selectedServiceIds;

  void addServiceId(int id) {
    if (!_selectedServiceIds.contains(id)) {
      _selectedServiceIds.add(id);
      notifyListeners();
    }
  }

  void removeServiceId(int id) {
    _selectedServiceIds.remove(id);
    notifyListeners();
  }

  // Added method to clear all service IDs
  void clearServiceIds() {
    _selectedServiceIds.clear();
    notifyListeners();
  }
}
