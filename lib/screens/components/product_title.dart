import 'package:ecom/const.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/responsive.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Price\n\n", style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: "\$${product.price}\n",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ])),
              SizedBox(
                width: kDefaultPaddin,
              ),
              Expanded(
                  child: Hero(
                tag: "id-${product.image}-${product.id}",
                child: Image.asset(
                  product.image,
                  //fit: BoxFit.fill,
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height < 600
                              ? 200
                              : 250
                          : 300
                      : 400,
                  height: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height < 600
                              ? 200
                              : 250
                          : 300
                      : 400,
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
