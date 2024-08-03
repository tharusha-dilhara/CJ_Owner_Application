import 'package:cjowner/components/customNavButton.dart';
import 'package:cjowner/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.applogout();
              context.pushReplacementNamed('login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              const Text(
                "Hello, Mr. Weerakoon",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              CustomListTile(
                leadingIcon: Icons.view_agenda,
                title: 'View Items',
                subtitle: 'View items description',
                onTap: () {
                  GoRouter.of(context).pushNamed('viewItems');
                },
              ),
              SizedBox(height: 10),
              CustomListTile(
                leadingIcon: Icons.verified,
                title: 'Verify Items',
                subtitle: 'Items in description',
                onTap: () {
                  GoRouter.of(context).pushNamed('verifyItems');
                },
              ),
              SizedBox(height: 10),
              CustomListTile(
                leadingIcon: Icons.people,
                title: 'Customers',
                subtitle: 'Items in description',
                onTap: () {
                  GoRouter.of(context).pushNamed('customers');
                },
              ),
              SizedBox(height: 10),
              CustomListTile(
                leadingIcon: Icons.people,
                title: 'Sales Reps',
                subtitle: 'Items in description',
                onTap: () {
                  GoRouter.of(context).pushNamed('salesReps');
                },
              ),
              SizedBox(height: 10),
              CustomListTile(
                leadingIcon: Icons.account_balance,
                title: 'branches',
                subtitle: 'Items in description',
                onTap: () {
                  GoRouter.of(context).pushNamed('branches');
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
