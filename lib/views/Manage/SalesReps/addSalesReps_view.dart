import 'package:flutter/material.dart';


class AddsalesrepsView extends StatelessWidget {
  const AddsalesrepsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Salesreps",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Add Salesreps View")),
    );
  }
}