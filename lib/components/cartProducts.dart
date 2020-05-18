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
  String size;
  String color;
  var quantity;
  final prod_price;

  CartProduct({
    this.prod_name,
    this.prod_picture,
    this.size,
    this.color,
    this.quantity,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          prod_picture,
          width: 60,
          height: 80,
        ),
        title: Text(prod_name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text("Size:"),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                    "${size} ",
                    style: TextStyle(color: Colors.red),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Text("Color:"),
                  flex: 1,
                ),
                Expanded(
                  child: Text(
                    "${color} ",
                    style: TextStyle(color: Colors.red),
                  ),
                  flex: 2,
                ),
              ],
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      "\$${prod_price}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_drop_up),
                            onPressed: () {
                              quantity += 1;
                            }),
                        Text("$quantity"),
                        IconButton(
                            icon: Icon(Icons.arrow_drop_down),
                            onPressed: () {
                              quantity -= 1;
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
            ),
          ],
        ),
      ),
    );
  }
}
