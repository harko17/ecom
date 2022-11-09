import 'package:ecom/const.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/responsive.dart';
import 'package:ecom/screens/components/buttonandcart.dart';
import 'package:ecom/screens/components/cart_counter.dart';
import 'package:ecom/screens/components/colorandsize.dart';
import 'package:ecom/screens/components/product_title.dart';
import 'package:flutter/material.dart';

class ItemBody extends StatelessWidget {
  final Product product;
  const ItemBody({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: Responsive.isMobile(context)
                      ? EdgeInsets.only(top: size.height * 0.3)
                      : EdgeInsets.only(top: size.height * 0.4),
                  height: Responsive.isMobile(context)
                      ? size.height * 0.7
                      : size.height * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 95,
                      ),
                      ColorAndSize(product: product),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPaddin,
                            vertical: kDefaultPaddin),
                        child: Text(
                          product.description,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCounter(
                            id: product.id,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: kDefaultPaddin),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red[400],
                            ),
                          ),
                        ],
                      ),
                      ButtonAndCart(product: product)
                    ],
                  ),
                ),
                ProductTitle(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
