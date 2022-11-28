import 'package:ecom/const.dart';
import 'package:ecom/home1.dart';
import 'package:ecom/screens/components/categories.dart';
import 'package:ecom/screens/components/compare.dart';
import 'package:ecom/screens/components/price2.dart';
import 'package:ecom/screens/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Compare()));
                },
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageSlideshow(
                /// Width of the [ImageSlideshow].
                width: double.maxFinite,
                height: 400.0,


                /// Height of the [ImageSlideshow].


                /// The page to show when first creating the [ImageSlideshow].
                initialPage: 0,

                /// The color to paint the indicator.
                indicatorColor: Colors.black,

                /// The color to paint behind th indicator.
                indicatorBackgroundColor: Colors.grey,

                /// The widgets to display in the [ImageSlideshow].
                /// Add the sample image file into the images folder
                children: [
                  Image.asset(
                    'assets/e1.jpg',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/e2.jpg',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/e3.jpg',
                    fit: BoxFit.contain,
                  ),

                  Image.asset(
                    'assets/e4.jpg',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/e5.jpg',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/e6.jpg',
                    fit: BoxFit.contain,
                  ),
                ],

                /// Called whenever the page in the center of the viewport changes.


                /// Auto scroll interval.
                /// Do not auto scroll with null or 0.
                autoPlayInterval: null,

                /// Loops back to first slide.
                isLoop: true,
              ),
            ),
            Column(
              children: [
                Center(child: Text("Compare Now",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold),)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('   Price   ',style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homo()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 20,
                          color: Colors.black
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Reviews',style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Compare()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                          fontSize: 20,
                            color: Colors.black
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Schedule Delivery'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orangeAccent,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
              ],
            ),

            // create widgets for each tab bar here



          ],

        ),
      ),
    );
  }
}
