import 'package:flutter/material.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';

class SelectedServicesProvider extends ChangeNotifier {
  final List<Service> _selectedServices = [];
  final List<int> _selectedServiceIDCatch = [];

  List<Service> get selectedServices => _selectedServices;

  List<int> get selectedServiceIDCatch => _selectedServiceIDCatch;

  // Function to add a service and its ID
  void addService(Service service) {
    if (!_selectedServices.contains(service)) {
      _selectedServices.add(service);
      _addServiceIDToCatch(service.id); // Add service ID to catch list
      notifyListeners();
    }
  }

  // Function to remove a service and its ID
  void removeService(Service service) {
    _selectedServices.remove(service);
    _removeServiceIDFromCatch(service.id); // Remove service ID from catch list
    notifyListeners();
  }

  // New function to add a service ID to the catch list
  void _addServiceIDToCatch(int serviceId) {
    if (!_selectedServiceIDCatch.contains(serviceId)) {
      _selectedServiceIDCatch.add(serviceId);
    }
  }

  // New function to remove a service ID from the catch list
  void _removeServiceIDFromCatch(int serviceId) {
    _selectedServiceIDCatch.remove(serviceId);
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
    if (_selectedServiceIds.contains(id)) {
      _selectedServiceIds.remove(id);
      notifyListeners();
    }
  }
}
