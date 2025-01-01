import 'package:flutter/material.dart';
import 'package:koko_ecommerce/components/my_drawer.dart';
import 'package:koko_ecommerce/components/my_product_tile.dart';
import 'package:koko_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    // final products = Provider.of<Shop>(context, listen: true).shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Shop Page'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          //shop subtitle
          Center(
            child: Text(
              'Pick from a selected list of premium products',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemCount: products.length,
              itemBuilder: (context, index) {
                //get each individual produc from shop
                final product = products[index];
                //retuan as a product title UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
