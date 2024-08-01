import 'package:flutter/material.dart';


class BranchsView extends StatelessWidget {
  const BranchsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("branchs",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("branchs View")),
    );
  }
}