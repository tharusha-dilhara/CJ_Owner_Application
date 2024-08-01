class StockItem {
  final String itemName;
  final int qty;
  final double rate;


  StockItem({
    required this.itemName,
    required this.qty,
    required this.rate,

  });

  Map<String, dynamic> toJson() => {
    'item_name': itemName,
    'qty': qty,
    'rate': rate
  };
}