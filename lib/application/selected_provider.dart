// import 'package:flutter/material.dart';
// import 'package:medion/domain/models/booking/booking_type_model.dart';
// import 'package:medion/domain/models/third_service_model/third_service_model.dart';

// class SelectedServicesProvider extends ChangeNotifier {
//   final Map<int, List<Service>> _selectedServicesByService = {};
//   final Map<int, Map<int, bool>> _serviceHasDoctorSessionByService = {};
//
//   int get totalSelectedServices {
//     int count = 0;
//     for (var serviceList in _selectedServicesByService.values) {
//       count += serviceList.length;
//     }
//     return count;
//   }
//
//   List<Service> getSelectedServices(int serviceId) => _selectedServicesByService[serviceId] ?? [];
//
//   bool hasDoctorSession(int serviceId, int serviceItemId) =>
//       _serviceHasDoctorSessionByService[serviceId]?[serviceItemId] ?? false;
//
//   void addService(int serviceId, Service service) {
//     _selectedServicesByService.putIfAbsent(serviceId, () => []);
//     if (!_selectedServicesByService[serviceId]!.contains(service)) {
//       _selectedServicesByService[serviceId]!.add(service);
//       _serviceHasDoctorSessionByService.putIfAbsent(serviceId, () => {})[service.id!] = false;
//       notifyListeners();
//     }
//   }
//
//   void removeService(int serviceId, Service service) {
//     _selectedServicesByService[serviceId]?.remove(service);
//     _serviceHasDoctorSessionByService[serviceId]?.remove(service.id!);
//     notifyListeners();
//   }
//
//   void markServiceHasDoctorSession(int serviceId, int serviceItemId, bool hasSession) {
//     if (_serviceHasDoctorSessionByService.containsKey(serviceId)) {
//       _serviceHasDoctorSessionByService[serviceId]![serviceItemId] = hasSession;
//       notifyListeners();
//     }
//   }
//
//   int get missingDoctorSessionsCount {
//     return _serviceHasDoctorSessionByService.values
//         .expand((map) => map.values)
//         .where((hasSession) => !hasSession)
//         .length;
//   }
//
//   void clearServices(int serviceId) {
//     _selectedServicesByService.remove(serviceId);
//     _serviceHasDoctorSessionByService.remove(serviceId);
//     notifyListeners();
//   }
// }

// class SelectedServiceIdsProvider extends ChangeNotifier {
//   final Map<int, List<int>> _selectedServiceIdsByService = {};
//   final Map<int, Map<int, int?>> _serviceDoctorSessionIdsByService = {};
//
//   List<int> getSelectedServiceIds(int serviceId) => _selectedServiceIdsByService[serviceId] ?? [];
//
//   void addServiceId(int serviceId, int id) {
//     _selectedServiceIdsByService.putIfAbsent(serviceId, () => []);
//     if (!_selectedServiceIdsByService[serviceId]!.contains(id)) {
//       _selectedServiceIdsByService[serviceId]!.add(id);
//       _serviceDoctorSessionIdsByService.putIfAbsent(serviceId, () => {})[id] = null;
//       notifyListeners();
//     }
//   }
//
//   void removeServiceId(int serviceId, int id) {
//     _selectedServiceIdsByService[serviceId]?.remove(id);
//     _serviceDoctorSessionIdsByService[serviceId]?.remove(id);
//     notifyListeners();
//   }
//
//   void setDoctorSessionId(int serviceId, int serviceItemId, int? sessionId) {
//     if (_serviceDoctorSessionIdsByService.containsKey(serviceId)) {
//       _serviceDoctorSessionIdsByService[serviceId]![serviceItemId] = sessionId;
//       notifyListeners();
//     }
//   }
//
//   int? getDoctorSessionId(int serviceId, int serviceItemId) {
//     return _serviceDoctorSessionIdsByService[serviceId]?[serviceItemId];
//   }
//
//   void clearServiceIds(int serviceId) {
//     _selectedServiceIdsByService.remove(serviceId);
//     _serviceDoctorSessionIdsByService.remove(serviceId);
//     notifyListeners();
//   }
//
//   void clearAllServiceIds() {
//     _selectedServiceIdsByService.clear();
//     _serviceDoctorSessionIdsByService.clear();
//     notifyListeners();
//   }
// }
