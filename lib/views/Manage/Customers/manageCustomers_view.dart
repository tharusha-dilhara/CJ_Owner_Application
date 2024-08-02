import 'package:flutter/material.dart';

class ManagecustomersView extends StatefulWidget {
  const ManagecustomersView({super.key});

  @override
  State<ManagecustomersView> createState() => _ManagecustomersViewState();
}

class _ManagecustomersViewState extends State<ManagecustomersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage Customers",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
             padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Shop Name',
                  border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Owner Name',
                  border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                  labelText: 'BER Number',
                  border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Mobile Phone Number',
                  border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Land Phone Number',
                  border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.green,
                  height: 55,
                  onPressed: (){},
                  child: Text("Update Customer", style: TextStyle(fontSize: 26)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}