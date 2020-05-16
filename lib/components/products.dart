import 'package:flutter/material.dart';
import 'package:atmmart/pages/productDetails.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Black T-Shirt",
      "picture":
          "https://rukminim1.flixcart.com/image/880/1056/k3ncakw0/t-shirt/z/g/u/s-ke-tshirt-rh-black-white-7086-rebound-original-imafmqgnkddgds5e.jpeg?q=50",
      "old_price": 999,
      "price": 179,
    },
    {
      "name": "Tshirt",
      "picture":
          "https://rukminim1.flixcart.com/image/880/1056/k0sgl8w0/jean/x/c/7/32-udjno5165-u-s-polo-association-original-imafkg6yfnmdgry6.jpeg?q=50",
      "old_price": 1999,
      "price": 999,
    },
    {
      "name": "Gown",
      "picture":
          "https://rukminim1.flixcart.com/image/880/1056/k3hmj680/gown/5/p/8/na-free-gra-3-trilok-fab-na-original-imafmhpw8cncdz6d.jpeg?q=50",
      "old_price": "3999",
      "price": "499",
    },
    {
      "name": "Salwar",
      "picture":
          "https://rukminim1.flixcart.com/image/880/1056/k2urhjk0/fabric/t/c/s/852dr157-852dr160-swaron-original-imafhvxfjz9ehs9z.jpeg?q=50",
      "old_price": "999",
      "price": "179",
    },
    {
      "name": "Tshirt",
      "picture":
          "https://rukminim1.flixcart.com/image/880/1056/k0sgl8w0/jean/x/c/7/32-udjno5165-u-s-polo-association-original-imafkg6yfnmdgry6.jpeg?q=50",
      "old_price": 1999,
      "price": 999,
    },
    {
      "name": "Gown",
      "picture":
          "https://rukminim1.flixcart.com/image/880/1056/k3hmj680/gown/5/p/8/na-free-gra-3-trilok-fab-na-original-imafmhpw8cncdz6d.jpeg?q=50",
      "old_price": "3999",
      "price": "499",
    },
    {
      "name": "Salwar",
      "picture":
          "https://rukminim1.flixcart.com/image/880/1056/k2urhjk0/fabric/t/c/s/852dr157-852dr160-swaron-original-imafhvxfjz9ehs9z.jpeg?q=50",
      "old_price": "999",
      "price": "179",
    },
  ];
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
          tag: prod_name,
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
//                    child: ListTile(
//                      leading: Text(
//                        prod_name,
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      ),
//                      title: Text(
//                        "\$$prod_price",
//                        style: TextStyle(
//                            color: Colors.red, fontWeight: FontWeight.w800),
//                      ),
//                      subtitle: Text(
//                        "\$$prod_old_price",
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontWeight: FontWeight.w600,
//                            decoration: TextDecoration.lineThrough),
//                      ),
//                    ),
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
