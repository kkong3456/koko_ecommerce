import 'package:flutter/material.dart';
import 'package:koko_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 10,
      description: 'Product 1 description Lorem ipsum dolor sit amet,'
          'consectetur adipiscing elit, sed do eiusmod tempor',
    ),
    Product(
      name: 'Product 2',
      price: 20,
      description: 'Product 2 description',
    ),
    Product(
      name: 'Product 3',
      price: 30,
      description: 'Product 3 description',
    ),
    Product(
      name: 'Product 4',
      price: 40,
      description: 'Product 4 description',
    ),
  ];
  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
