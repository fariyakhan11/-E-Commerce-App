import 'package:flutter/material.dart';
import 'item_main.dart';

//--------------menu list Bar------------
class DropdownScreen extends StatelessWidget {
  const DropdownScreen({Key? key}) : super(key: key);
  static const appTitle = 'CATEGORIES';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: Categories(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

//--------------menu list items---------------
class Categories extends StatelessWidget {
  const Categories({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
              title: const Text('SOFA'),
              leading: const Icon(Icons.chair),
              iconColor: Colors.deepPurple,
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => EcommerceApp()),);
                        }
                          );
    return Scaffold(
      appBar: AppBar(title: Text(title),
          backgroundColor:Colors.tealAccent ,
          foregroundColor: Colors.black,
      ),

      //------------Body text--------------------------

      body: Center(
        child: Column(
          children: <Widget>[
            Text("BED") ,
            Image.asset('assets/images/bed.png'),
            Text("SOFA") ,
            Image.asset('assets/images/sofa_yellow.png'),
          ],
        ),
      ),



      drawer: Drawer(
        child: ListView(
          // menu pr tap kr k jo drawer khulta hamburger menu
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text('iNTERIAR'),
            ),
            listTile,
            ListTile(
              title: const Text('BED'),
              leading: const Icon(Icons.bed),
              iconColor: Colors.deepPurple,
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EcommerceApp()),
  );
              },
            ),
            ListTile(
              title: const Text('CHAIR'),
              leading: const Icon(Icons.chair),
              iconColor: Colors.deepPurple,
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EcommerceApp()),
  );
              },
            ),
          ],
        ),
      ),
    );
  }
}