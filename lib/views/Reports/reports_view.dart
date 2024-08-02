import 'package:cjowner/components/customNavButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(centerTitle: true, title: const Text("Reports", style: TextStyle(fontWeight: FontWeight.bold))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            CustomListTile(
              leadingIcon: Icons.access_time,
              title: 'Daily Reports',
              subtitle: 'Daily Reports',
              onTap: () {
                GoRouter.of(context).pushNamed('dailyReports');
              },
            ),
            const SizedBox(height: 18),
            CustomListTile(
              leadingIcon: Icons.calendar_month,
              title: 'Monthly Reports',
              subtitle: 'Monthly Reports',
              onTap: () {
                GoRouter.of(context).pushNamed('monthlyReports');
              },
            ),
            const SizedBox(height: 18),
            CustomListTile(
              leadingIcon: Icons.analytics,
              title: 'Sales Reps Reports',
              subtitle: 'Sales Reps Reports',
              onTap: () {
                GoRouter.of(context).pushNamed('salesRepsReports');
              },
            ),
          ],
        ),
      ),
    );
  }
}
