import 'package:flutter/material.dart';


class PricingitemView extends StatelessWidget {
  const PricingitemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pricing item",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("Pricing item View")),
    );
  }
}