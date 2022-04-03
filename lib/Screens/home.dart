import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('iNTERIAR'),
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
      ),
      //---------------------image--------------------
      body: Column(
          children: <Widget>[
            Text("\nWelcome to the Furnitureworld \n ") ,
            Image.asset('assets/images/bed.png'),
            Text("\nShop your Favourite Furniture around the world! \n ") ,
    //     alignment: Alignment.center,
    //     child: FittedBox(child: Image.asset('assets/images/b3.jpg'),
    // fit: BoxFit.cover),
      ],
      ),
    );
  }
}
