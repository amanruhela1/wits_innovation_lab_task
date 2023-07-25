import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_wits_innovation_lab/view/cart.dart';
import 'package:task_wits_innovation_lab/view/cart_page.dart';
import 'package:task_wits_innovation_lab/view/product_listing_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ProductListingPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

