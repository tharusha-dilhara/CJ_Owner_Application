import 'package:flutter/material.dart';


class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reports")
      ),
      body: Center(child: Text("repsreport View")),
    );
  }
}