import 'package:flutter/material.dart';
import 'package:atmmart/components/cartProducts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Cart"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.yellow[800],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total"),
                subtitle: Text("\$456"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                child: Text(
                  "Check Out",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
