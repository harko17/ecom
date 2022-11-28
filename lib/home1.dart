import 'package:ecom/const.dart';
import 'package:ecom/screens/components/body.dart';
import 'package:ecom/screens/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({Key? key}) : super(key: key);

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
      body: Body(),
    );
  }
}
