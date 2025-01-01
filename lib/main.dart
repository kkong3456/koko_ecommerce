import 'package:flutter/material.dart';
import 'package:koko_ecommerce/models/shop.dart';
import 'package:koko_ecommerce/pages/cart_page.dart';
import 'package:koko_ecommerce/pages/intro_page.dart';
import 'package:koko_ecommerce/pages/shop_page.dart';
import 'package:koko_ecommerce/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: lightMode,
        routes: {
          '/intro_page': (context) => const IntroPage(),
          '/shop_page': (context) => const ShopPage(),
          '/cart_page': (context) => const CartPage(),
        });
  }
}
