import 'package:flutter/material.dart';
import 'package:book_app/Screens/bottom_bar.dart';
import 'splash_screen.dart';
import 'screens/cart.dart';
import 'screens/home.dart';
import 'screens/app_bar.dart';
import 'screens/cart_page.dart';
import 'Screens/book_item_card.dart';
import 'Screens/items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



