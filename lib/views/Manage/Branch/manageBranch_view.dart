import 'package:flutter/material.dart';


class ManagebranchView extends StatelessWidget {
  const ManagebranchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage branchs",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Manage branchs View")),
    );
  }
}