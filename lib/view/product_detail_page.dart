import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_wits_innovation_lab/view/cart.dart';
import 'package:task_wits_innovation_lab/view/cart_page.dart';
import 'package:task_wits_innovation_lab/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartPage(),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Price: \$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Description: ${product.description}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  onPressed: () {
                  Provider.of<Cart>(context, listen: false).addItem(product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartPage(), // Open the cart page after adding to cart
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_shopping_cart),
                    SizedBox(width: 8),
                    Text('Add to Cart', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
