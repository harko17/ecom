import 'package:ecom/add_to_cart.dart';
import 'package:ecom/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:ecom/const.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddToCart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Shopping System',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
