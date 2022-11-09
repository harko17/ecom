import 'package:ecom/models/cart.dart';
import 'package:flutter/cupertino.dart';

class AddToCart extends ChangeNotifier {
  void addToCart(Cart item) {
    cartItems.add(item);
    notifyListeners();
  }

  int getCount(int id) {
    return cartItems.any((element) => element.product.id == id)
        ? cartItems.firstWhere((element) => element.product.id == id).count
        : 0;
  }

  void updateCart(int id, String op) {
    if (op == "add") {
      cartItems.firstWhere((element) => element.product.id == id).count++;
    }
    if (op == "remove") {
      cartItems.firstWhere((element) => element.product.id == id).count--;
      if (cartItems.firstWhere((element) => element.product.id == id).count <=
          0) {
        cartItems.removeWhere((element) => element.product.id == id);
      }
    }
    notifyListeners();
  }
}
