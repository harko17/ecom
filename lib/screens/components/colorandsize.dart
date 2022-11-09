import 'package:ecom/const.dart';
import 'package:ecom/models/product.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Color"),
                Row(
                  children: [
                    ColorDot(
                      color: Colors.blue,
                    ),
                    ColorDot(
                      color: Colors.cyan,
                    ),
                    ColorDot(
                      color: Colors.amber,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: kTextColor),
                children: [
                  TextSpan(text: "Size\n"),
                  TextSpan(
                    text: "${product.size} cm",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  const ColorDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
      height: 24,
      width: 24,
      padding: EdgeInsets.all(2.5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
          )),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
