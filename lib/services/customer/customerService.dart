import 'dart:convert';
import 'package:cjowner/config/config.dart';
import 'package:cjowner/models/customer.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  final String baseUrl = '${Config.baseurl}/customer';

//get customers
  Future<List<Customer>> getCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/getAllCustomers'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Customer.fromJson(json)).toList();
    } else {
      print('Failed to fetch customers: ${response.body}');
      throw Exception('Failed to load customers');
    }
  }

//get single customer
  Future<Customer> getCustomer(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/getCustomerById/$id'));

    if (response.statusCode == 200) {
      return Customer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load customer');
    }
  }

//add customer
  Future<void> addCustomer(Customer customer) async {
    final response = await http.post(
      Uri.parse('$baseUrl/addCustomer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(customer.toJson()),
    );

    if (response.statusCode == 201) {
      return;
    } else if (response.statusCode == 400) {
      String message = json.decode(response.body)['message'];
      throw Exception(message);
    } else {
      throw Exception('Failed to add customer');
    }
  }

//update customer
  Future<void> updateCustomer(String id, Customer customer) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateCustomer/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(customer.toJson()),
    );

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      String message = json.decode(response.body)['message'];
      throw Exception(message);
    } else {
      throw Exception('Failed to update customer');
    }
  }

//delete customer
  Future<void> deleteCustomer(String id) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/deleteCustomer/$id'));

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 404) {
      String message = json.decode(response.body)['message'];
      throw Exception(message);
    } else {
      throw Exception('Failed to delete customer');
    }
  }
}
