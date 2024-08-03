import 'package:cjowner/models/manageCustomer.dart';
import 'package:cjowner/services/customer/customerService.dart';
import 'package:flutter/material.dart';
import 'package:cjowner/models/customer.dart';

class ManagecustomersView extends StatefulWidget {

  final manageCustomer customer;

  const ManagecustomersView({super.key, required this.customer});

  @override
  State<ManagecustomersView> createState() => _ManagecustomersViewState();
}

class _ManagecustomersViewState extends State<ManagecustomersView> {

  late TextEditingController _shopNameController;
  late TextEditingController _ownerNameController;
  late TextEditingController _addressController;
  late TextEditingController _berNumberController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _landNumberController;

  @override
  void initState() {
    super.initState();
    _shopNameController = TextEditingController(text: widget.customer.shopName);
    _ownerNameController = TextEditingController(text: widget.customer.ownerName);
    _addressController = TextEditingController(text: widget.customer.address);
    _berNumberController = TextEditingController(text: widget.customer.berNumber);
    _mobileNumberController = TextEditingController(text: widget.customer.mobileNumber);
    _landNumberController = TextEditingController(text: widget.customer.landNumber);
  }

  @override
  void dispose() {
    _shopNameController.dispose();
    _ownerNameController.dispose();
    _addressController.dispose();
    _berNumberController.dispose();
    _mobileNumberController.dispose();
    _landNumberController.dispose();
    super.dispose();
  }

//  Future<void> _updateCustomer() async {
//     try {
//       final updatedCustomer = manageCustomer(
//         id: widget.customer.id,
//         shopName: _shopNameController.text,
//         ownerName: _ownerNameController.text,
//         address: _addressController.text,
//         berNumber: _berNumberController.text,
//         mobileNumber: _mobileNumberController.text,
//         landNumber: _landNumberController.text,
//       );
//       await CustomerService.updateCustomer(widget.customer.id!, updateCustomer);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Customer updated successfully')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     }
//   }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage Customers", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                TextField(
                  controller: _shopNameController,
                  decoration: InputDecoration(
                    labelText: 'Shop Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _ownerNameController,
                  decoration: InputDecoration(
                    labelText: 'Owner Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _berNumberController,
                  decoration: InputDecoration(
                    labelText: 'BER Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _mobileNumberController,
                  decoration: InputDecoration(
                    labelText: 'Mobile Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _landNumberController,
                  decoration: InputDecoration(
                    labelText: 'Land Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.green,
                  height: 55,
                  onPressed: () {
                    print(widget.customer.id);
                  },
                  child: Text("Update Customer", style: TextStyle(fontSize: 26)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
