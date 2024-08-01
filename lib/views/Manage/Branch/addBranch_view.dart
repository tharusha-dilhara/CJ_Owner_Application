import 'package:flutter/material.dart';


class AddbranchView extends StatelessWidget {
  const AddbranchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add branch",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Add branch View")),
    );
  }
}