import 'package:flutter/material.dart';


class ManageView extends StatelessWidget {
  const ManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage")
      ),
      body: Center(child: Text("Manage View")),
    );
  }
}