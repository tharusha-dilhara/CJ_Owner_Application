import 'package:cjowner/components/customNavButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ItemsinView extends StatelessWidget {
  const ItemsinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFF1F1F1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Items In",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            CustomListTile(
              leadingIcon: Icons.add_to_photos,
              title: 'Add Stock',
              subtitle: 'Items in description',
              onTap: () {
                GoRouter.of(context).pushNamed('addStock');
              },
            ),
            const SizedBox(height: 18),
            CustomListTile(
              leadingIcon: Icons.add_to_photos,
              title: 'Verify Items',
              subtitle: 'Items in description',
              onTap: () {
                GoRouter.of(context).pushNamed('verifyItems');
              },
            ),
            const SizedBox(height: 18),
            CustomListTile(
              leadingIcon: Icons.add_to_photos,
              title: 'Pricing Items',
              subtitle: 'Items in description',
              onTap: () {
                GoRouter.of(context).pushNamed('pricingItem');
              },
            ),
            const SizedBox(height: 18),
            CustomListTile(
              leadingIcon: Icons.add_to_photos,
              title: 'Register items',
              subtitle: 'Items in description',
              onTap: () {
                GoRouter.of(context).pushNamed('registerItems');
              },
            ),

          ],
        )
      )
    );
  }
}