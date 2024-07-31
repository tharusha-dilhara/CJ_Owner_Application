import 'package:flutter/material.dart';


class VerifyitemsView extends StatelessWidget {
  const VerifyitemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Verify items",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Verify items View")),
    );
  }
}