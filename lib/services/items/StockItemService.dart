import 'dart:convert';
import 'package:cjowner/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:cjowner/models/StockItem.dart';

class StockItemService {
  final String _baseUrl = 'http://44.222.204.165/api/stock';

  Future<List<StockItem>> fetchStockItems() async {
    final String? token = await AuthService.getToken();

    final response = await http.get(
      Uri.parse('$_baseUrl/getAllStockItems'),
      headers: token != null ? {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      } : {},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => StockItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load stock items');
    }
  }
}
