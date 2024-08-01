import 'package:flutter/material.dart';


class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Customers",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Customers View")),
    );
  }
}