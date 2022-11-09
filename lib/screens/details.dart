import 'package:ecom/const.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/screens/components/item_details.dart';
import 'package:ecom/screens/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Details extends StatelessWidget {
  final Product product;

  const Details({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: product.color,
        appBar: AppBar(
          backgroundColor: product.color,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back.svg"),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  color: kTextColor,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewCart()));
                },
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  color: kTextColor,
                )),
            SizedBox(
              width: kDefaultPaddin / 2,
            )
          ],
        ),
        body: ItemBody(
          product: product,
        ));
  }
}
