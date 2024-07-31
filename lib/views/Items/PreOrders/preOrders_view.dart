import 'package:flutter/material.dart';


class PreordersView extends StatelessWidget {
  const PreordersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Preorders",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Preorders View")),
    );
  }
}