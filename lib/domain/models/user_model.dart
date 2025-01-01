class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String middleName;
  final String phoneNumber;
  final String additionalPhoneNumber;
  final String documentType;
  final String passportSerial;
  final String dateOfBirth;
  final String dateOfIssue;
  final String issueOrganization;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.phoneNumber,
    required this.additionalPhoneNumber,
    required this.documentType,
    required this.passportSerial,
    required this.dateOfBirth,
    required this.dateOfIssue,
    required this.issueOrganization,
  });

  /// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'phoneNumber': phoneNumber,
      'additionalPhoneNumber': additionalPhoneNumber,
      'documentType': documentType,
      'passportSerial': passportSerial,
      'dateOfBirth': dateOfBirth,
      'dateOfIssue': dateOfIssue,
      'issueOrganization': issueOrganization,
    };
  }

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      middleName: json['middleName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      additionalPhoneNumber: json['additionalPhoneNumber'] ?? '',
      documentType: json['documentType'] ?? '',
      passportSerial: json['passportSerial'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      dateOfIssue: json['dateOfIssue'] ?? '',
      issueOrganization: json['issueOrganization'] ?? '',
    );
  }
}
