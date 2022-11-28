import 'package:ecom/const.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}
int selectedIndex = 0;
class _CategoriesState extends State<Categories> {
  List<String> categories = ["Trimmers", "Bags", "Mobiles", "Laptops","Clothes"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
          child: SizedBox(

            height: 26,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => buildCategory(index),
            ),
          ),
        ),

      ],
    );
  }

  Widget buildCategory(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            setState(() {
              rev();
            });
          });

        },

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor,
                ),
              ),

              Container(
                margin:
                    EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      );
}
Widget rev()
{
  return WebView(
    initialUrl: selectedIndex==0?'https://www.flipkart.com/philips-bt3211-15-trimmer-60-min-runtime-20-length-settings/product-reviews/itm37c003eff1632?pid=TMRF5GBHHDMHRVHH&lid=LSTTMRF5GBHHDMHRVHHAGHDLS&marketplace=FLIPKART':"https://www.nykaaman.com/philips-corded-cordless-rechargeable-beard-trimmer-bt3211-15/reviews/781064?skuId=781064&ptype=reviews",
    javascriptMode: JavascriptMode.unrestricted,
    onWebViewCreated: (WebViewController webViewController) {
      //_controller = webViewController;
    },
  );
}