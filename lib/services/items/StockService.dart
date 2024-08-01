import 'dart:convert';
import 'package:cjowner/config/config.dart';
import 'package:cjowner/models/AddStockRequest.dart';
import 'package:cjowner/models/StockInfo.dart';
import 'package:cjowner/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;

class StockService {
  final String apiUrl = '${Config.baseurl}/stock/addStock';

  Future<void> addStock(AddStockRequest request) async {
    final String? token = await AuthService.getToken();
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        print('Stock added successfully');
      } else {
        print('Failed to add stock: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<List<StockInfo>> fetchStockData() async {
    final String? token = await AuthService.getToken();
    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    // Make the HTTP GET request
    final response = await http.get(
      Uri.parse('http://54.87.237.56/api/stock/verifyItems'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> stockDataList = data['data'];

      return stockDataList
          .map((stockItem) => StockInfo.fromJson(stockItem))
          .toList();
    } else {
      throw Exception('Failed to load stock data');
    }
  }
}
