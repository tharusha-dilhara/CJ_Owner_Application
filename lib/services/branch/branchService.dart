import 'dart:convert';
import 'package:cjowner/config/config.dart';
import 'package:http/http.dart' as http;
import '../../models/branch.dart';

// Define the base URL of your API
const String baseUrl = '${Config.baseurl}/branch';

class BranchService {
  // Create a new branch
  Future<void> createBranch(Branch branch) async {
    final url = Uri.parse('$baseUrl/addBranch');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(branch.toJson()),
    );

    if (response.statusCode == 200) {
      print('Branch created successfully!');
    } else if (response.statusCode == 400) {
      // Handle case where branch ID already exists
      final responseBody = jsonDecode(response.body);
      throw Exception(responseBody['message'] ??
          'Failed to create branch or branch is already exist');
    } else {
      print('Failed to create branch: ${response.body}');
    }
  }

  // Read branch details
  Future<Branch> getBranch(String branchId) async {
    final url = Uri.parse('$baseUrl/getBranchById/$branchId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Branch.fromJson(json.decode(response.body));
    } else {
      final responseBody = jsonDecode(response.body);
      throw Exception(
          'Failed to fetch branch details: ${responseBody['message'] ?? response.body}');
    }
  }

  // Update branch details
  Future<void> updateBranch(String branchId, String branchName) async {
    final url = Uri.parse('$baseUrl/updateBranch/$branchId');
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'branchName': branchName}),
    );

    if (response.statusCode == 200) {
      print('Branch updated successfully!');
    } else if (response.statusCode == 400) {
      final responseBody = jsonDecode(response.body);
      throw Exception(responseBody['message'] ??
          'Failed to update branch or branch already exists');
    } else {
      print('Failed to update branch: ${response.body}');
    }
  }

  // Delete a branch
  Future<void> deleteBranch(String branchId) async {
    final url = Uri.parse('$baseUrl/deleteBranch/$branchId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print('Branch deleted successfully!');
    } else {
      final responseBody = jsonDecode(response.body);
      throw Exception(
          'Failed to delete branch: ${responseBody['message'] ?? response.body}');
    }
  }

  // Get all branches
  Future<List<Branch>> getAllBranches() async {
    final url = Uri.parse('$baseUrl/getAllBranches');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Branch.fromJson(json)).toList();
    } else {
      print('Failed to fetch branches: ${response.body}');
      throw Exception('Failed to fetch branches');
    }
  }
}
