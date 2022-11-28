
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/screens/components/compare.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screens/components/webV.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../const.dart';
import '../../home1.dart';
import '../view_cart.dart';

class homo extends StatefulWidget {
  const homo({Key? key}) : super(key: key);

  @override
  _homoState createState() => _homoState();
}

class _homoState extends State<homo> {

  void _handleURLButtonPress(BuildContext context, String url, String title) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewPage(url, title)));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
      body:

      SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                body(),

              ],
            )),
      ),

    );
  }
  Widget body()
  {

    var stream = FirebaseFirestore.instance.collection('service').snapshots();
    return  StreamBuilder(
      stream: stream,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }


        return GridView.count(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          crossAxisCount: 2,

          children: snapshot.data!.docs.map((document) {
            var title=document['title'];
            var link=document['link'];
            var pic=document['pic'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  _handleURLButtonPress(
                      context, link, title);
                },
                child: Container(
                  width: 50,
                  height: 100,
                  color: Colors.black12,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(28, 8, 28, 8),
                        child: Image.network("$pic"),
                      ),
                      Text("$title",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),),
                    ],
                  ),
                ),
              ),
            );

          }).toList(),
        );
      },
    );
  }


}