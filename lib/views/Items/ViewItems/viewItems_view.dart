import 'package:flutter/material.dart';


class ViewitemsView extends StatelessWidget {
  const ViewitemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("View items",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("View items View")),
    );
  }
}