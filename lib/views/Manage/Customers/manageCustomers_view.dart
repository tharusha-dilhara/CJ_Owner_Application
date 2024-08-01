import 'package:flutter/material.dart';


class ManagecustomersView extends StatelessWidget {
  const ManagecustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage Customers",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Manage Customers View")),
    );
  }
}