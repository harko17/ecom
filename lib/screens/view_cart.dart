import 'package:ecom/add_to_cart.dart';
import 'package:ecom/const.dart';
import 'package:ecom/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({Key? key}) : super(key: key);

  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: kTextColor,
            cacheColorFilter: true,
          ),
        ),
      ),
      body: Consumer<AddToCart>(
        builder: (context, cartItems, child) => Container(
          child: child,
        ),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) => Card(
                elevation: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          constraints:
                              BoxConstraints(maxHeight: 200, maxWidth: 200),
                          padding: EdgeInsets.all(kDefaultPaddin / 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: cartItems[index].product.color,
                          ),
                          child: Image.asset(
                            cartItems[index].product.image,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            cartItems[index].product.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            "\$${cartItems[index].product.price.toString()}\n",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Row(
                            children: [
                              buildButton(Icons.remove, () {
                                if (cartItems[index].count > 0)
                                  setState(() {
                                    cartItems[index].count--;
                                  });
                              }),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPaddin / 2),
                                child: Text(
                                  cartItems[index]
                                      .count
                                      .toString()
                                      .padLeft(2, "0"),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              buildButton(Icons.add, () {
                                setState(() {
                                  cartItems[index].count++;
                                });
                              })
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text("Total: ${getTotal()}",
                      style: TextStyle(
                        fontSize: 30,
                      ))),
            )
          ],
        ),
      ),
    );
  }

  int getTotal() {
    int c = 0;
    for (var i = 0; i < cartItems.length; i++) {
      c += cartItems[i].product.price * cartItems[i].count;
    }
    return c;
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
