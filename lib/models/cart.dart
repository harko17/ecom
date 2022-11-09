import 'package:ecom/models/product.dart';

class Cart {
  int count;
  final Product product;
  Cart({required this.count, required this.product});
}

List<Cart> cartItems = [];
