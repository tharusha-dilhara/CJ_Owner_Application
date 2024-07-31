import 'package:flutter/material.dart';


class AdditemView extends StatelessWidget {
  const AdditemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add item",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Add item View")),
    );
  }
}