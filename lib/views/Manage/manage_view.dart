import 'package:cjowner/components/customNavButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ManageView extends StatelessWidget {
  const ManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage")
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            CustomListTile(
              leadingIcon: Icons.add_to_photos,
              title: 'Sales Reps',
              subtitle: 'Sales Reps description',
              onTap: () {
                GoRouter.of(context).pushNamed('salesReps');
              },
            ),
            const SizedBox(height: 18),
            CustomListTile(
              leadingIcon: Icons.insert_comment_sharp,
              title: 'Branch',
              subtitle: 'Branch in description',
              onTap: () {
                GoRouter.of(context).pushNamed('branches');
              },
            ),
            const SizedBox(height: 18),
            CustomListTile(
              leadingIcon: Icons.add_to_photos,
              title: 'customers',
              subtitle: 'customers description',
              onTap: () {
                GoRouter.of(context).pushNamed('customers');
              },
            ),     
          ],
          
        ),
      ),
    );
  }
}