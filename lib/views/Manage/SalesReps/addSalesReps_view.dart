import 'package:cjowner/models/salesRep.dart';
import 'package:cjowner/services/auth/auth_service.dart';
import 'package:cjowner/services/salesrep/salesrepservice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddsalesrepsView extends StatefulWidget {
  const AddsalesrepsView({super.key});

  @override
  AddsalesrepsViewState createState() => AddsalesrepsViewState();
}

class AddsalesrepsViewState extends State<AddsalesrepsView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nicController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  // Removed _branchnameController as it's not needed with Dropdown
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final SalesRepService _salesRepService = SalesRepService();

  // List to hold branch names fetched from API
  List<String> _branches = [];
  String? _selectedBranch; // Variable to hold selected branch name

  @override
  void initState() {
    super.initState();
    _fetchBranches(); // Fetch branches when the widget is initialized
  }

  // Function to fetch branches from API
  // Function to fetch branches from API with authentication
Future<void> _fetchBranches() async {
  try {
    final String? token = await AuthService.getToken();

    final response = await http.get(
      Uri.parse('http://13.60.98.76/api/branch/getAllBranches'),
      headers: token != null ? {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      } : {},
    );

    if (response.statusCode == 200) {
      final List<dynamic> branchList = json.decode(response.body);
      setState(() {
        _branches = List<String>.from(branchList);
        _selectedBranch = _branches.isNotEmpty ? _branches[0] : null; // Select the first branch by default
      });
      
    } else {
      throw Exception('Failed to load branches');

    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load branches: $e')),
    );
    
  }
}


  void _addSalesRep() async {
    if (_formKey.currentState!.validate()) {
      final salesRep = SalesRepModel(
        name: _nameController.text,
        nic: _nicController.text,
        address: _addressController.text,
        dob: _dobController.text,
        mobileNumber: _mobileNumberController.text,
        branchname: _selectedBranch ?? '', // Use selected branch
        email: _emailController.text,
        password: _passwordController.text,
      );

      final success = await _salesRepService.addSalesRep(salesRep);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sales representative added successfully')),
        );
        GoRouter.of(context).pushReplacementNamed("manage");
        // Optionally clear the form or navigate away
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add sales representative')),
        );
        GoRouter.of(context).pushReplacementNamed("manage");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Sales Representative')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter name' : null,
              ),
              TextFormField(
                controller: _nicController,
                decoration: InputDecoration(labelText: 'NIC'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter NIC' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter address' : null,
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter date of birth' : null,
              ),
              TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter mobile number' : null,
              ),
              // Dropdown for Branch Name
              DropdownButtonFormField<String>(
                value: _selectedBranch,
                items: _branches.map((branch) {
                  return DropdownMenuItem<String>(
                    value: branch,
                    child: Text(branch),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBranch = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Branch Name'),
                validator: (value) =>
                    value == null ? 'Please select a branch' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addSalesRep,
                child: Text('Add Sales Representative'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
