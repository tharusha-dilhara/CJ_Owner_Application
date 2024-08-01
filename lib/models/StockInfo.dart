class StockInfo {
  final String stockOrderIndex;
  final double totalItemsPrice;
  final int itemsCount;
  final String customDate;
  final String customTime;

  StockInfo({
    required this.stockOrderIndex,
    required this.totalItemsPrice,
    required this.itemsCount,
    required this.customDate,
    required this.customTime,
  });

  factory StockInfo.fromJson(Map<String, dynamic> json) {
    final items = json['items'] as List<dynamic>;
    final totalItemsPrice = items.fold(0.0, (sum, item) => sum + (item['price']));

    return StockInfo(
      stockOrderIndex: json['stock_order_index'],
      totalItemsPrice: totalItemsPrice,
      itemsCount: items.length,
      customDate: json['customDate'],
      customTime: json['customTime'],
    );
  }
}
