import 'package:ecom/add_to_cart.dart';
import 'package:ecom/const.dart';
import 'package:ecom/models/cart.dart';
import 'package:ecom/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final int id;
  const CartCounter({required this.id, Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState(id: id);
}

class _CartCounterState extends State<CartCounter> {
  int id;
  _CartCounterState({required this.id});
  String count = "";
  int numofItems = 0;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AddToCart>(context, listen: false);
    setState(() {
      count = prov.getCount(this.id).toString().padLeft(2, "0");
    });
    return Consumer<AddToCart>(
      builder: (context, item, child) => SizedBox(
        child: child,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Row(
          children: [
            buildButton(Icons.remove, () {
              prov.updateCart(this.id, "remove");
              setState(() {
                count = prov.getCount(this.id).toString().padLeft(2, "0");
              });
            }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
              child: Text(
                count,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildButton(Icons.add, () {
              if (cartItems.any((element) => element.product.id == this.id)) {
                prov.updateCart(this.id, "add");
              } else if ((cartItems
                      .any((element) => element.product.id != this.id) ||
                  cartItems.isEmpty)) {
                prov.addToCart(Cart(
                    count: 1,
                    product: products
                        .firstWhere((element) => element.id == this.id)));
              }
              setState(() {
                count = prov.getCount(this.id).toString().padLeft(2, "0");
              });
            })
          ],
        ),
      ),
    );
  }

  SizedBox buildButton(IconData icon, Function() press) {
    return SizedBox(
      height: 32,
      width: 40,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
              side: BorderSide(color: kTextLightColor))),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: kTextColor,
        ),
      ),
    );
  }
}
