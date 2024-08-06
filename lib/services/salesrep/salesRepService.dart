// lib/services/sales_rep_service.dart
import 'dart:convert';
import 'package:cjowner/models/salesRep.dart';
import 'package:cjowner/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;

class SalesRepService {
  final String _baseUrl = 'http://44.222.204.165/api/salesrep';

  Future<bool> addSalesRep(SalesRepModel salesRep) async {
    final String? token = await AuthService.getToken();
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    final url = Uri.parse('$_baseUrl/addSalesRep');
    final body = jsonEncode(salesRep.toJson());

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      return true;
    } else {
      // Handle error response
      print('Failed to add sales rep: ${response.body}');
      return false;
    }
  }
}
