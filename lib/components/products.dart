import 'package:flutter/material.dart';
import 'package:atmmart/pages/productDetails.dart';
import 'package:atmmart/data/products.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = getProducts();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
              prod_name: product_list[index]["name"],
              prod_old_price: product_list[index]["old_price"],
              prod_picture: product_list[index]["picture"],
              prod_price: product_list[index]["price"]);
        });
  }
}

class SingleProduct extends StatelessWidget {
  String prod_name;
  String prod_picture;
  final prod_price;
  final prod_old_price;

  SingleProduct(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: Text("test-1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        prod_name: prod_name,
                        prod_price: prod_price,
                        prod_old_price: prod_old_price,
                        prod_url: prod_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            prod_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(
                          "\$${prod_price}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  child: Image.network(
                    prod_picture,
                    fit: BoxFit.scaleDown,
                  )),
            ),
          )),
    );
  }
}
