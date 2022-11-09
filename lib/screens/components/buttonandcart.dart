import 'package:ecom/const.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/screens/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonAndCart extends StatelessWidget {
  const ButtonAndCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 58,
            margin: EdgeInsets.only(right: kDefaultPaddin),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: product.color)),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                color: product.color,
                cacheColorFilter: true,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewCart()));
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(product.color),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)))),
                child: Text(
                  "Buy now",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
