import 'package:flutter/material.dart';
import 'package:atmmart/data/cartProducts.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_on_cart = getCartProducts();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          var p = products_on_cart[index];
          return CartProduct(
            prod_price: p["price"],
            size: p["size"],
            color: p["color"],
            prod_name: p["name"],
            quantity: p["quantity"],
            prod_picture: p["picture"],
          );
        });
  }
}

class CartProduct extends StatelessWidget {
  String prod_name;
  String prod_picture;
  final prod_price;
  String size;
  String color;
  final quantity;

  CartProduct({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.size,
    this.color,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
