import 'package:flutter/material.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';

class SelectedServicesProvider extends ChangeNotifier {
  final List<Service> _selectedServices = [];
  // Track which services have doctor sessions selected
  final Map<int, bool> _serviceHasDoctorSession = {};

  List<Service> get selectedServices => _selectedServices;

  bool hasDoctorSession(int serviceId) =>
      _serviceHasDoctorSession[serviceId] ?? false;

  void addService(Service service) {
    if (!_selectedServices.contains(service)) {
      _selectedServices.add(service);
      // Initialize doctor session tracking for this service
      _serviceHasDoctorSession[service.id!] = false;
      notifyListeners();
    }
  }

  void removeService(Service service) {
    _selectedServices.remove(service);
    _serviceHasDoctorSession.remove(service.id!);
    notifyListeners();
  }

  void markServiceHasDoctorSession(int serviceId, bool hasSession) {
    if (_serviceHasDoctorSession.containsKey(serviceId)) {
      _serviceHasDoctorSession[serviceId] = hasSession;
      notifyListeners();
    }
  }

  int get missingDoctorSessionsCount {
    return _serviceHasDoctorSession.values
        .where((hasSession) => !hasSession)
        .length;
  }

  void clearServices() {
    _selectedServices.clear();
    _serviceHasDoctorSession.clear();
    notifyListeners();
  }
}

class SelectedServiceIdsProvider extends ChangeNotifier {
  List<int> _selectedServiceIds = [];
  // Track doctor session IDs for each service
  final Map<int, int?> _serviceDoctorSessionIds = {};

  List<int> get selectedServiceIds => _selectedServiceIds;

  void addServiceId(int id) {
    if (!_selectedServiceIds.contains(id)) {
      _selectedServiceIds.add(id);
      // Initialize doctor session tracking for this service
      _serviceDoctorSessionIds[id] = null;
      notifyListeners();
    }
  }

  void removeServiceId(int id) {
    _selectedServiceIds.remove(id);
    _serviceDoctorSessionIds.remove(id);
    notifyListeners();
  }

  void setDoctorSessionId(int serviceId, int? sessionId) {
    if (_serviceDoctorSessionIds.containsKey(serviceId)) {
      _serviceDoctorSessionIds[serviceId] = sessionId;
      notifyListeners();
    }
  }

  int? getDoctorSessionId(int serviceId) {
    return _serviceDoctorSessionIds[serviceId];
  }

  void clearServiceIds() {
    _selectedServiceIds.clear();
    _serviceDoctorSessionIds.clear();
    notifyListeners();
  }
}
