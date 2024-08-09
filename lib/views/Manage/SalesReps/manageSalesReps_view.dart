import 'package:cjowner/models/salesRep.dart';
import 'package:flutter/material.dart';

class ManagesalesrepsView extends StatefulWidget {
  final SalesRepModel salesRep;  // Add this line to receive the sales rep data

  const ManagesalesrepsView({super.key, required this.salesRep});

  @override
  State<ManagesalesrepsView> createState() => _ManagesalesrepsViewState();
}

class _ManagesalesrepsViewState extends State<ManagesalesrepsView> {
  late TextEditingController nameController;
  late TextEditingController nicController;
  late TextEditingController addressController;
  late TextEditingController dobController;
  late TextEditingController mobileNumberController;
  late TextEditingController emailController;
  late TextEditingController branchNameController;  // New branch name controller

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.salesRep.name);
    nicController = TextEditingController(text: widget.salesRep.nic);
    addressController = TextEditingController(text: widget.salesRep.address);
    dobController = TextEditingController(text: widget.salesRep.dob);
    mobileNumberController = TextEditingController(text: widget.salesRep.mobileNumber);
    emailController = TextEditingController(text: widget.salesRep.email);
    branchNameController = TextEditingController(text: widget.salesRep.branchname);  // Initialize branch name controller
  }

  @override
  void dispose() {
    nameController.dispose();
    nicController.dispose();
    addressController.dispose();
    dobController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    branchNameController.dispose();  // Dispose branch name controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Manage Sales Reps",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nicController,
                  decoration: const InputDecoration(
                    labelText: 'NIC',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: dobController,
                  decoration: const InputDecoration(
                    labelText: 'DOB',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: mobileNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: branchNameController,  // Branch name field
                  decoration: const InputDecoration(
                    labelText: 'Branch Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.green,
                  height: 55,
                  onPressed: () {
                    // Add functionality to update the sales rep here
                  },
                  child: const Text(
                    "Update Sales Rep",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                 const SizedBox(height: 15),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.green,
                  height: 55,
                  onPressed: () {
                    // Add functionality to update the sales rep here
                  },
                  child: const Text(
                    "Delete Sales Rep",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
