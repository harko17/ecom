import 'package:ecom/const.dart';
import 'package:ecom/screens/components/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../home1.dart';
import '../view_cart.dart';

class Compare extends StatefulWidget {
  const Compare({Key? key}) : super(key: key);

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Harsh Kotary"),
                accountEmail: Text("harkodev@gmail.com",style: TextStyle(color: Colors.white70),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://drive.google.com/uc?export=view&id=1plPyldcB-TJjnAymoYyt-ib6UtBulCe6"),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.pexels.com/photos/1666067/pexels-photo-1666067.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("About"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.grid_3x3_outlined),
                title: Text("Products"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text("Contact"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen1()),
                  );
                },
              )
            ],
          ),
        ),

        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[

            Column(
              children: [
                SizedBox(
                  height: 50,
                  child: AppBar(
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      labelColor: Colors.black,
                      isScrollable: true,
                      indicatorColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: "Flipkart",
                        ),
                        Tab(
                          text: "Amazon",
                        ),
                        Tab(
                          text: "Myntra",
                        ),
                        Tab(
                          text: "Nykaa",
                        ),
                        Tab(
                          text: "Reliance",
                        ),
                        Tab(
                          text: "Official",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  WebView(
                    initialUrl: selectedIndex==0?'https://www.flipkart.com/philips-bt3211-15-trimmer-60-min-runtime-20-length-settings/product-reviews/itm37c003eff1632?pid=TMRF5GBHHDMHRVHH&lid=LSTTMRF5GBHHDMHRVHHAGHDLS&marketplace=FLIPKART':"https://www.nykaaman.com/philips-corded-cordless-rechargeable-beard-trimmer-bt3211-15/reviews/781064?skuId=781064&ptype=reviews",
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      //_controller = webViewController;
                    },
                  ),

                  // second tab bar viiew widget
                  WebView(
                    initialUrl: "https://www.amazon.in/Philips-BT3231-15-Smart-Trimmer/product-reviews/B09NMDPF2Y/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews",
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      //_controller = webViewController;
                    },
                  ),

                  WebView(
                    initialUrl: "https://www.myntra.com/reviews/6518755",
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      //_controller = webViewController;
                    },
                  ),

                  WebView(
                    initialUrl: "https://www.nykaaman.com/philips-corded-cordless-rechargeable-beard-trimmer-bt3211-15/reviews/781064?skuId=781064&ptype=reviews",
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      //_controller = webViewController;
                    },
                  ),

                  Center(
                    child: Text(
                        "There are no reviews for this product yet.",style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,

                    ),
                    ),
                  ),

                  WebView(
                    initialUrl: "https://www.philips.co.in/c-p/BT3211_15/beardtrimmer-series-3000#reviews",
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      //_controller = webViewController;
                    },
                  ),


                ],
              ),
            ),


          ],

        ),
      ),
    );
  }
}
