import 'package:flutter/material.dart';
import 'package:book_app/Screens/app_bar.dart';
import 'cart_page.dart';
import 'book_item_card.dart';
import 'items.dart';

//-----------------------------items details name---------------
class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurple,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookItem> _items = [];
  List<BookItem> _cart = [];

  @override
  void initState() {
    _items = items
        .map((item) => BookItem.fromMap(item))
        .toList();
    // Cart is initially empty
    _cart = [];
    super.initState();
  }
  // --------------------cart functionality------------------
  void _pushCart() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)
    {return CartPage(
      cart: _cart,
      cartChanged: (value) {setState(() {_cart = value;});},
                    );
    },
    ),
    );
  }
  //---------------------app bar-----------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iNTERIAR"),
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //--------------------------Shopping cart icon app bar-------------
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _pushCart,
          ),
        ],
      ),
      //--------------------------------list View-------------------------
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return BookItemCard(
            cart: _cart,
            item: _items[index],
            onChanged: (bool inCart) => setState(()
            {
              if (inCart)
                _cart.remove(_items[index]);
              else
                _cart.add(_items[index]);
            }),
          );
        },
      ),
    );
  }
}

class BookItemCard extends StatelessWidget {
  BookItemCard({
    Key? key,
    required this.cart,
    required this.item,
    required this.onChanged,
  }) : super(key: key);

  late final List<BookItem> cart;
  late final BookItem item;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    bool _inCart = cart.contains(item);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 12,
      ),
      child: ListTile(
        tileColor: Color(0xADDEBBFA),
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.img),
              // fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          item.name,
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.headline1,
        ),
        subtitle: Text(
          "Price: ${item.price.toString()}\$",
          style: TextStyle(
              fontSize: 18, color: Colors.deepPurple),
        ),
        trailing: IconButton(
          onPressed: () => onChanged(_inCart),
          icon: _inCart
              ? Icon(Icons.remove_shopping_cart_rounded)
              : Icon(Icons.add_shopping_cart_rounded),
          color: _inCart ? Colors.red : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
