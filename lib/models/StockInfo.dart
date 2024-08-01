class StockInfo {
  final String stockOrderIndex;
  final double totalItemsPrice;
  final int itemsCount;
  final String customDate;
  final String customTime;
  final List<Map<String, dynamic>> items;

  StockInfo({
    required this.stockOrderIndex,
    required this.totalItemsPrice,
    required this.itemsCount,
    required this.customDate,
    required this.customTime,
    required this.items,
  });

  factory StockInfo.fromJson(Map<String, dynamic> json) {
    // Extracting the items list from JSON and calculating the totalItemsPrice
    final items = json['items'] as List<dynamic>;

    final totalItemsPrice = items.fold<double>(0.0, (sum, item) {
      final price = (item['price'] ?? 0.0) ;
      return sum + price;
    });

    return StockInfo(
      stockOrderIndex: json['_id'] ?? '',
      totalItemsPrice: totalItemsPrice,
      itemsCount: items.length,
      customDate: json['customDate'] ?? '',
      customTime: json['customTime'] ?? '',
      items: items.map((item) => Map<String, dynamic>.from(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // Convert the StockInfo object into a JSON map
    return {
      'stock_order_index': stockOrderIndex,
      'total_items_price': totalItemsPrice,
      'items_count': itemsCount,
      'customDate': customDate,
      'customTime': customTime,
      'items': items.map((item) => Map<String, dynamic>.from(item)).toList(),
    };
  }

  @override
  String toString() {
    // Override the toString method for easy debugging and printing
    return 'StockInfo(stockOrderIndex: $stockOrderIndex, totalItemsPrice: $totalItemsPrice, itemsCount: $itemsCount, customDate: $customDate, customTime: $customTime, items: $items)';
  }
}
