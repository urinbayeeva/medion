class AppointmentItem {
  final String time;
  final String date;
  final String startTime;
  final String endTime;
  final String price;
  final String location;
  final String imagePath;
  final String doctorName;
  final String serviceName;
  final String specialty;
  final String service;
  final int serviceId;
  final int doctorID;
  final int companyID;
  final int? orderDetailId;

  const AppointmentItem({
    required this.doctorName,
    required this.service,
    required this.price,
    required this.location,
    required this.imagePath,
    required this.time,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.serviceId,
    required this.serviceName,
    required this.specialty,
    required this.doctorID,
    required this.companyID,
    this.orderDetailId,
  });
}
