import 'dart:async';
import 'dart:io';

import 'package:ecom/screens/components/price2.dart';
import 'package:ecom/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../const.dart';
import '../../home1.dart';
import '../view_cart.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);

  @override
  WebViewPageState createState() =>
      WebViewPageState(this.url, this.title);
}

class WebViewPageState extends State<WebViewPage> {
  final String url;
  final String title;

  WebViewPageState(this.url, this.title);
  late WebViewController _controller;

  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: Scaffold(
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
          body: WebView(
              initialUrl: this.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controllerCompleter.future.then((value) => _controller = value);
                _controllerCompleter.complete(webViewController);
              }
          )
      ),
    );
  }
  Future<bool> _goBack(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Return to'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  var count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 3;
                  });
                },
                child: Text('Product'),
              ),
              if(this.url!="https://pub.dev")
              FlatButton(
                onPressed: () {
                  var count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                },
                child: Text('Price Compare'),
              ),
            ],
          ));
      return Future.value(true);
    }
  }
}