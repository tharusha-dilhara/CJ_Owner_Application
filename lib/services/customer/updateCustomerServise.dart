import 'dart:convert';
import 'package:cjowner/models/manageCustomer.dart';
import 'package:http/http.dart' as http;
import 'package:cjowner/models/customer.dart';

class UpdateCustomerService {
  // Define the base URL for the API endpoint
  static const String _baseUrl = 'http://54.87.237.56/api/customer';

  // Function to update customer details
  static Future<bool> updateCustomer(String customerId, manageCustomer customer) async {
    final url = '$_baseUrl/updateCustomer/$customerId';
    
    // Prepare the request body
    final body = jsonEncode({
      "shopName": customer.shopName,
      "ownerName": customer.ownerName,
      "address": customer.address,
      "berNumber": customer.berNumber,
      "mobileNumber": customer.mobileNumber,
      "landNumber": customer.landNumber
    });

    try {
      // Make the POST request
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        print('Customer updated successfully');
        return true;
      } else {
        print('Failed to update customer: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error updating customer: $e');
      return false;
    }
  }
}
