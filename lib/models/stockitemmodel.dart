// lib/models/stock_item_model.dart

class StockItemmodel {
  final String? id;
  final String itemName;
  final String companyName;
  final String companyAddress;
  final int qty;
  final int rate;
  final int amountOfItems;
  final int? discount;
  final String? margin;
  final int? price;
  final String customDate;
  final String customTime;

  StockItemmodel({
    required this.id,
    required this.itemName,
    required this.companyName,
    required this.companyAddress,
    required this.qty,
    required this.rate,
    required this.amountOfItems,
    this.discount,
    this.margin,
    this.price,
    required this.customDate,
    required this.customTime,
  });

  // Factory method to create a StockItem from JSON
  factory StockItemmodel.fromJson(Map<String, dynamic> json) {
    return StockItemmodel(
      id: json['_id'],
      itemName: json['itemName'],
      companyName: json['companyName'],
      companyAddress: json['companyAddress'],
      qty: json['qty'],
      rate: json['rate'],
      amountOfItems: json['amountOfItems'],
      discount: json['discount'],
      margin: json['margin'],
      price: json['price'],
      customDate: json['customDate'],
      customTime: json['customTime'],
    );
  }
}
