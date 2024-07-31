import 'package:flutter/material.dart';


class RegisteritemsView extends StatelessWidget {
  const RegisteritemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register items",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Register items View")),
    );
  }
}