// lib/services/pricing_item_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../auth/auth_service.dart';  // Import the AuthService

class PricingItemService {
  final String apiUrl = "http://54.87.237.56/api/stock/zeroPricingItems";

  Future<List<String>> fetchZeroPricingItems() async {
    try {
      // Retrieve the token using AuthService
      final String? token = await AuthService.getToken();

      // Set up the headers including Authorization if the token is not null
      final headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };

      // Make the HTTP GET request with headers
      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      // Check if the response is successful
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Check if the API response indicates success
        if (jsonResponse['success'] == true) {
          List<String> items = List<String>.from(jsonResponse['data']);
          return items;
        } else {
          throw Exception('Failed to retrieve data: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
