import 'package:flutter/material.dart';
import 'package:koko_ecommerce/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //drawer header : logo
        Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            const SizedBox(height: 25),
            //show title
            MyListTile(
              text: 'Shop',
              icon: Icons.home,
              onTap: () => Navigator.of(context).pop(),
            ),
            //cart title
            MyListTile(
              text: 'Cart',
              icon: Icons.shopping_cart,
              onTap: () => Navigator.of(context).pushNamed('/cart_page'),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: MyListTile(
            text: 'Exit',
            icon: Icons.logout,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/intro_page',
              (route) => false,
            ),
          ),
        ),
        //exit shot tile
      ],
    ));
  }
}
