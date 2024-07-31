import 'package:flutter/material.dart';


class ViewitemsView extends StatelessWidget {
  const ViewitemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View items View"),
        centerTitle: true,
      ),
      body: Center(child: Text("View items View")),
    );
  }
}