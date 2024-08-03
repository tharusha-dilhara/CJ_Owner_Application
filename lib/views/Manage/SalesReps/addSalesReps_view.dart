import 'package:flutter/material.dart';

class AddsalesrepsView extends StatefulWidget {
  const AddsalesrepsView({super.key});

  @override
  State<AddsalesrepsView> createState() => _AddsalesrepsViewState();
}

class _AddsalesrepsViewState extends State<AddsalesrepsView> {
  TextEditingController _dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Sales Rep",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'NIC',
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
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: 'DOB',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.green,
                  height: 55,
                  onPressed: () {},
                  child: Text("Add Sales Rep", style: TextStyle(fontSize: 26)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
