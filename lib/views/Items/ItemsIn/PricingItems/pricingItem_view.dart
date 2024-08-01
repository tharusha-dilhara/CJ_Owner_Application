// lib/views/pricing_item_view.dart

import 'package:cjowner/services/items/pricing_item_service.dart';
import 'package:flutter/material.dart';


class PricingitemView extends StatefulWidget {
  const PricingitemView({super.key});

  @override
  _PricingitemViewState createState() => _PricingitemViewState();
}

class _PricingitemViewState extends State<PricingitemView> {
  final PricingItemService _pricingItemService = PricingItemService();
  late Future<List<String>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _pricingItemService.fetchZeroPricingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pricing Items",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No items found.'));
          } else {
            List<String> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
