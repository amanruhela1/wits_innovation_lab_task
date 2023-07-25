import 'package:flutter/material.dart';
import 'package:task_wits_innovation_lab/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItemsCount => _items.length;

  double get itemTotal {
    double total = 0;
    _items.forEach((item) {
      total += item.product.price * item.quantity;
    });
    return total;
  }

  double get deliveryFee => 30; // $30 delivery charge 
  double get totalPriceWithDelivery => itemTotal + deliveryFee;

  void addItem(Product product) {
    for (CartItem item in _items) {
      if (item.product.id == product.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void incrementItem(Product product) {
    for (CartItem item in _items) {
      if (item.product.id == product.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
  }

  void decrementItem(Product product) {
    for (CartItem item in _items) {
      if (item.product.id == product.id) {
        if (item.quantity > 1) {
          item.quantity--;
          notifyListeners();
        }
        return;
      }
    }
  }
}
