// lib/views/add_sales_reps_view.dart
import 'package:cjowner/models/salesRep.dart';
import 'package:cjowner/services/salesrep/salesrepservice.dart';
import 'package:flutter/material.dart';

class AddsalesrepsView extends StatefulWidget {
  const AddsalesrepsView({super.key});

  @override
  AddSalesRepsViewState createState() => AddSalesRepsViewState();
}

class AddSalesRepsViewState extends State<AddsalesrepsView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nicController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final SalesRepService _salesRepService = SalesRepService();

  void _addSalesRep() async {
    if (_formKey.currentState!.validate()) {
      final salesRep = SalesRepModel(
        name: _nameController.text,
        nic: _nicController.text,
        address: _addressController.text,
        dob: _dobController.text,
        mobileNumber: _mobileNumberController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      final success = await _salesRepService.addSalesRep(salesRep);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sales representative added successfully')),
        );
        // Optionally clear the form or navigate away
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add sales representative')),
        );
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
                validator: (value) => value!.isEmpty ? 'Please enter name' : null,
              ),
              TextFormField(
                controller: _nicController,
                decoration: InputDecoration(labelText: 'NIC'),
                validator: (value) => value!.isEmpty ? 'Please enter NIC' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) => value!.isEmpty ? 'Please enter address' : null,
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                validator: (value) => value!.isEmpty ? 'Please enter date of birth' : null,
              ),
              TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                validator: (value) => value!.isEmpty ? 'Please enter mobile number' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Please enter email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Please enter password' : null,
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
