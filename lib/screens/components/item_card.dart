import 'package:ecom/const.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/screens/details.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => Details(product: product))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                // width: 160,
                // height: 180,
                decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16)),
                child: Hero(
                    tag: "id-${product.image}-${product.id}",
                    child: Image.asset(
                      product.image,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
