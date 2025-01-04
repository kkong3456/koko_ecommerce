import 'package:flutter/material.dart';
import 'package:koko_ecommerce/models/product.dart';
import 'package:koko_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          //yes button
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);
              //remove item from cart
              context.read<Shop>().removeFromCart(product);

              print('delete item from cart');
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context){
    showDialog(
      context:context,
      builder:(context)=>AlertDialog(
        content:const Text('User wants to pay! Connect this app to you payment'),

      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [
          //car list
          Expanded(
            child: cart.isEmpty?const Center(child:Text('Your cart is empty..'))
            :ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                //get indivisual item in cart
                var item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: ()=>payButtonPressed(context),
              child:const Text('Pay Now'),
            ),
          )
        ],
      ),
    );
  }
}
