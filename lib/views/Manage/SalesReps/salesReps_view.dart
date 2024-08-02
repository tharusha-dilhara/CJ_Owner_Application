import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SalesrepsView extends StatefulWidget {
  const SalesrepsView({super.key});

  @override
  State<SalesrepsView> createState() => _SalesrepsViewState();
}

class _SalesrepsViewState extends State<SalesrepsView> {
  @override
  Widget build(BuildContext context) {
    // Example data
    final List<Map<String, String>> salesRep = [
      {'name': 'John Doe', 'mobileNumber': '0716723971'},
      {'name': 'Jane Smith', 'mobileNumber': '0761298321'},
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Salesreps",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.green,
                height: 55,
                onPressed: () {
                  GoRouter.of(context).pushNamed('addsalesReps');
                },
                child:
                    const Text("Add Sales Reps", style: TextStyle(fontSize: 26)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: salesRep.length,
                  itemBuilder: (context, index) {
                    final rep = salesRep[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        onTap: () {
                          GoRouter.of(context).pushNamed('manageSalesReps');
                        },
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          rep['name'] ?? 'Unknown',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Bold title text
                            color: Colors.black, // Title text color
                          ),
                        ),
                        subtitle: Text(
                          rep['mobileNumber'] ?? 'No Mobile Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w400, // Bold title text
                            color: Colors.black, // Title text color
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
