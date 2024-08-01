import 'package:cjowner/models/StockInfo.dart';
import 'package:cjowner/services/items/StockService.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyitemsView extends StatefulWidget {
  const VerifyitemsView({super.key});

  @override
  State<VerifyitemsView> createState() => _VerifyitemsViewState();
}

class _VerifyitemsViewState extends State<VerifyitemsView> {
  late Future<List<StockInfo>> futureStockInfo;

  @override
  void initState() {
    super.initState();
    futureStockInfo = StockService().fetchStockData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verify items',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<StockInfo>>(
        future: futureStockInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final stockInfos = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: stockInfos.length,
                itemBuilder: (context, index) {
                  final stockInfo = stockInfos[index];
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0), // Adjust margins as needed
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // Shadow color
                          spreadRadius: 2, // Shadow spread
                          blurRadius: 20, // Shadow blur
                          offset: Offset(0, 3), // Shadow offset
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        
                        GoRouter.of(context).pushNamed(
                          'verifyItem',
                          extra: stockInfo, // Pass the StockInfo object
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      title: Text(
                        'Stock Order Index: ${stockInfo.stockOrderIndex}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Bold title text
                          color: Colors.black, // Title text color
                        ),
                      ),
                      subtitle: Text(
                        'Total Items Price: ${stockInfo.totalItemsPrice.toStringAsFixed(2)}\nItems Count: ${stockInfo.itemsCount}',
                        style: TextStyle(
                          color: Colors.grey[600], // Subtitle text color
                        ),
                      ),
                      trailing: Column(
                        children: [
                          Text('${stockInfo.customDate}'),
                          Text('${stockInfo.customTime}'),
                        ],
                      ), // Trailing info icon
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
