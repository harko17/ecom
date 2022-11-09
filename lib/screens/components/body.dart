import 'package:ecom/const.dart';
import 'package:ecom/screens/components/categories.dart';
import 'package:ecom/screens/components/item_card.dart';
import 'package:ecom/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ecom/responsive.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Categories(),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.isMobile(context)
                            ? 2
                            : Responsive.isTablet(context)
                                ? 3
                                : 5,
                        mainAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: kDefaultPaddin),
                    itemBuilder: (context, index) => ItemCard(
                          product: products[index],
                        ))))
      ],
    );
  }
}
