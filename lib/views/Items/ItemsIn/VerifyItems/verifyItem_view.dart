import 'package:flutter/material.dart';


class VerifyitemView extends StatelessWidget {
  const VerifyitemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Verify item",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Verify item View")),
    );
  }
}