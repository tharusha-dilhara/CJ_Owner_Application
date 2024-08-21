import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cjowner/models/stockitemmodel.dart';
import 'package:cjowner/services/items/pricing_item_service.dart';

class PricingitemView extends StatefulWidget {
  const PricingitemView({super.key});

  @override
  _PricingitemViewState createState() => _PricingitemViewState();
}

class _PricingitemViewState extends State<PricingitemView> {
  final StockPricingService _service = StockPricingService();
  List<StockItemmodel> _stockItems = [];
  List<StockItemmodel> _filteredStockItems = [];
  bool _isLoading = false;
  String _searchQuery = "";

  Future<void> _loadStockItems() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _stockItems = await _service.fetchStockItems();
      _filteredStockItems = _stockItems; // Initially show all items
    } catch (e) {
      // Handle errors here
      print('Error loading stock items: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStockItems();
  }

  void _filterStockItems(String query) {
    List<StockItemmodel> results;
    if (query.isEmpty) {
      results = _stockItems;
    } else {
      results = _stockItems.where((item) {
        final itemName = item.itemName.toLowerCase();
        final searchQuery = query.toLowerCase();
        return itemName.contains(searchQuery);
      }).toList();
    }

    setState(() {
      _filteredStockItems = results;
      _searchQuery = query;
    });
  }

  void _openEditPage(StockItemmodel item) {
    GoRouter.of(context).pushNamed('editpricingItem',extra: item);
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _filterStockItems,
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _filteredStockItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredStockItems[index];
                      return GestureDetector(
                        onTap: () => _openEditPage(item),
                        child: Card(
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.itemName,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text('Company: ${item.companyName}'),
                                Text('Address: ${item.companyAddress}'),
                                Text('Quantity: ${item.qty}'),
                                Text('Rate: ${item.rate}'),
                                Text('Amount of Items: ${double.tryParse(item.amountOfItems)?.toStringAsFixed(2)}'),
                                if (item.discount != null)
                                  Text('Discount: ${item.discount}'),
                                if (item.margin != null)
                                  Text('Margin: ${item.margin} %'),
                                if (item.price != null)
                                  Text('Price: ${item.price}'),
                                Text('Date: ${item.customDate}'),
                                Text('Time: ${item.customTime}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadStockItems,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
