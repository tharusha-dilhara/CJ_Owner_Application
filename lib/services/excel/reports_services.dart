import 'dart:convert';
import 'dart:io';
import 'package:cjowner/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExcelGenerator {
  final String? token; // Token passed to the constructor

  ExcelGenerator({this.token});

  // Fetch data from the API with optional authorization
  Future<List<dynamic>> fetchInvoices() async {
    final String? token = await AuthService.getToken();

    final response = await http.get(
      Uri.parse('http://13.60.98.76/api/excel/getAllInvoices'),
      headers: token != null ? {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      } : {},
    );

    print(response.body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load invoices');
    }
  }

  // Generate Excel file
  Future<void> generateExcel(List<dynamic> invoices) async {
    var excel = Excel.createExcel();
    Sheet sheet = excel['Invoices'];

    // Add header row
    sheet.appendRow([
      "Sales Name",
      "Branch Name",
      "Shop Name",
      "Amount",
      "items",
      "Payment Method",
      "Date",
      "Time"
    ]);

    // Add invoice data
    for (var invoice in invoices) {
      String items = (invoice['items'] as List).map((item) => "${item['itemName']} (${item['qty']} x ${item['price']} - ${item['discount']})").join(', ');

      sheet.appendRow([
        invoice['salesRepId']['name'],
        invoice['branchname'],
        invoice['shopName'],
        invoice['amount'].toString(), // Convert numeric values to string
        items,
        invoice['paymentMethod'],
        invoice['customDate'],
        invoice['customTime']
      ]);
    }

    // Get the document directory to save the file
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/invoices.xlsx";

    // Save the file
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);
    
    print('Excel file saved at: $filePath');

    // Share the file
    await Share.shareFiles([filePath], text: 'Here are the invoices.');
  }

  // Main function to fetch data and generate Excel
  Future<void> fetchAndGenerateExcel() async {
    try {
      List<dynamic> invoices = await fetchInvoices();
      await generateExcel(invoices);
    } catch (e) {
      print('Error: $e');
    }
  }
}
