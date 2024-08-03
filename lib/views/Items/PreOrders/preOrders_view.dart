import 'package:flutter/material.dart';
import 'package:cjowner/models/average_quantity_model.dart';
import 'package:cjowner/services/items/average_quantity_service.dart';

class PreordersView extends StatefulWidget {
  const PreordersView({super.key});

  @override
  _PreordersViewState createState() => _PreordersViewState();
}

class _PreordersViewState extends State<PreordersView> {
  final AverageQuantityService _service = AverageQuantityService();
  AverageQuantityResponse? _averageQuantityResponse;
  bool _isLoading = true;
  String _searchQuery = '';
  List<String> _filteredItemNames = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await _service.fetchAverageQuantity();
    setState(() {
      _averageQuantityResponse = response;
      _filteredItemNames = response?.items.keys.toList() ?? [];
      _isLoading = false;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _filteredItemNames = _averageQuantityResponse?.items.keys
              .where((itemName) => itemName
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
              .toList() ??
          [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Preorders",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _averageQuantityResponse == null
              ? const Center(child: Text("Failed to load data"))
              : Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search by item name...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _filteredItemNames.length,
                          itemBuilder: (context, index) {
                            final itemName = _filteredItemNames[index];
                            final item = _averageQuantityResponse!.items[itemName];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                                leading: const Icon(
                                  Icons.fastfood,
                                  color: Colors.orangeAccent,
                                  size: 40.0,
                                ),
                                title: Text(
                                  itemName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'Current Qty: ${item?.currentQty}',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      'Average Qty: ${item?.averageQty}',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      'Difference: ${item?.difference}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: item!.difference!.isNegative ?? false
                                            ? Colors.redAccent
                                            : Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Icon(
                                  item!.difference!.isNegative ?? false
                                      ? Icons.arrow_downward
                                      : Icons.arrow_upward,
                                  color: item!.difference!.isNegative ?? false
                                      ? Colors.redAccent
                                      : Colors.green,
                                ),
                                tileColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
