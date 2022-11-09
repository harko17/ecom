import 'package:ecom/const.dart';
import 'package:ecom/screens/components/body.dart';
import 'package:ecom/screens/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                color: kTextColor,
                cacheColorFilter: true,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewCart()));
              },
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                color: kTextColor,
                cacheColorFilter: true,
              )),
          SizedBox(
            width: kDefaultPaddin / 2,
          )
        ],
        centerTitle: true,
        title: Text(
          "Shopeaz",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
