import 'package:flutter/material.dart';


class ManagesalesrepsView extends StatelessWidget {
  const ManagesalesrepsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage salesreps",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Manage salesreps View")),
    );
  }
}