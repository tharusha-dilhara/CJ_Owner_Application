import 'package:flutter/material.dart';


class SalesrepsView extends StatelessWidget {
  const SalesrepsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Salesreps",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Salesreps View")),
    );
  }
}