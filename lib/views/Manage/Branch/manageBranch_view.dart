import 'package:cjowner/models/branch.dart';
import 'package:flutter/material.dart';

class ManagebranchView extends StatefulWidget {

  final String branchName;
  final String branchId;

  const ManagebranchView({Key? key, required this.branchName, required this.branchId});

  @override
  State<ManagebranchView> createState() => _ManagebranchViewState();
}

class _ManagebranchViewState extends State<ManagebranchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage branchs",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(child: Text("${widget.branchId} ${widget.branchName}"),
      )
    );
    
  }
}