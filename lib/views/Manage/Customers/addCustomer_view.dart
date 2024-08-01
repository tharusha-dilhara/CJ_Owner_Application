import 'package:flutter/material.dart';


class AddcustomerView extends StatelessWidget {
  const AddcustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Customers",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Add Customers View")),
    );
  }
}