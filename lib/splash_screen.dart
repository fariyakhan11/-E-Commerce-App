import 'dart:async';
import 'package:book_app/Screens/bottom_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomBarScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0x7698F3FF),
              Color(0x6AF321FF),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
          [Column(
            children: [
              Image.asset('assets/images/sofa_pellow.png',
                height: 300.0,
                width: 300.0,),
              Text ('',
                textAlign: TextAlign.center,
                style:TextStyle(
                    color:Colors.deepPurple,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    // fontFamily: ,
                    fontSize: 28.0 ),
                    ),
                  ],
                ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
