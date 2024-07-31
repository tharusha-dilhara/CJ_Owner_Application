import 'package:flutter/material.dart';


class PreordersView extends StatelessWidget {
  const PreordersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preorders View"),
        centerTitle: true,
      ),
      body: Center(child: Text("Preorders View")),
    );
  }
}