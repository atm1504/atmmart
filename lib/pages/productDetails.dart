import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String prod_name;
  String prod_url;
  var prod_price;
  var prod_old_price;
  ProductDetails(
      {this.prod_name, this.prod_url, this.prod_price, this.prod_old_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("atmmart"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.yellow[800],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.yellow[800],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
                child: Container(
              color: Colors.white,
              child: Image.network(widget.prod_url),
            )),
          )
        ],
      ),
    );
  }
}
