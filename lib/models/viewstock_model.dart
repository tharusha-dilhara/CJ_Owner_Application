// item_model.dart

class ViewStock {
  final String id;
  final String itemName;
  final String companyName;
  final String companyAddress;
  final int qty;
  final double rate;
  final int amountOfItems;
  final double? discount;
  final String? margin;
  final double? price;
  final String customDate;
  final String customTime;

  ViewStock({
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

  factory ViewStock.fromJson(Map<String, dynamic> json) {
    return ViewStock(
      id: json['_id'],
      itemName: json['itemName'],
      companyName: json['companyName'],
      companyAddress: json['companyAddress'],
      qty: json['qty'],
      rate: json['rate'].toDouble(),
      amountOfItems: json['amountOfItems'],
      discount: json['discount']?.toDouble(),
      margin: json['margin'],
      price: json['price']?.toDouble(),
      customDate: json['customDate'],
      customTime: json['customTime'],
    );
  }
}
