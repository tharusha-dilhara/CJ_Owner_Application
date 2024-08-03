// lib/models/sales_rep_model.dart
class SalesRepModel {
  final String name;
  final String nic;
  final String address;
  final String dob;
  final String mobileNumber;
  final String email;
  final String password;

  SalesRepModel({
    required this.name,
    required this.nic,
    required this.address,
    required this.dob,
    required this.mobileNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nic': nic,
      'address': address,
      'dob': dob,
      'mobileNumber': mobileNumber,
      'email': email,
      'password': password,
    };
  }
}
