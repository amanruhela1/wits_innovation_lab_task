import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_wits_innovation_lab/models/product.dart';
import 'package:task_wits_innovation_lab/view/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cart.totalItemsCount == 0
          ? Center(
              child: Text('Your cart is empty.'),
            )
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                var cartItem = cart.items[index];
                return ListTile(
                  leading: Image.network(
                    cartItem.product.image,
                    height: 50,
                  ),
                  title: Text(cartItem.product.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${cartItem.product.price.toStringAsFixed(2)} x ${cartItem.quantity}'),
                      SizedBox(height: 4),
                      Text('Item Cost: \$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          cart.incrementItem(cartItem.product);
                        },
                        icon: Icon(Icons.add),
                      ),
                      Text(cartItem.quantity.toString()),
                      IconButton(
                        onPressed: () {
                          cart.decrementItem(cartItem.product);
                        },
                        icon: Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () {
                          cart.removeItem(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.totalItemsCount == 0
        ? null
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Item Cost: \$${cart.itemTotal.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 4),
                if (cart.totalItemsCount > 0) // Conditionally show shipping fee
                  Text(
                    'Shipping Fee: \$${cart.deliveryFee.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                Divider(),
                Text(
                  'Total Amount: \$${cart.totalPriceWithDelivery.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
    );
  }
}
