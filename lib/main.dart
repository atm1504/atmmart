import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'components/horizontal_list_view.dart';
import 'components/products.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              "https://rukminim1.flixcart.com/image/880/1056/jlo1tow0/kids-t-shirt/h/k/x/3-4-years-kids-sl-boys-5c-tshirts-05-ml-kiddeo-original-imaf8qseeu4bgwrg.jpeg?q=50"),
          NetworkImage('https://i.ytimg.com/vi/JAv7mLpyjJE/maxresdefault.jpg'),
          NetworkImage(
              'https://morrispsych.com/wp-content/uploads/2009/12/girls.jpg'),
          NetworkImage(
              'https://i.dailymail.co.uk/1s/2019/12/13/22/22217802-0-image-a-98_1576275536642.jpg'),
          NetworkImage(
              'https://d224nth7ac0evy.cloudfront.net/blog/cache/840x620/magefan_blog/Blog-Ideas-Man.jpg'),
          NetworkImage('https://i.ytimg.com/vi/Fzf1NyBO5P0/hqdefault.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.red,
      ),
    );
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // Header
            UserAccountsDrawerHeader(
              accountName: Text("atm"),
              accountEmail: Text("atm1504.in@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange[900],
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.yellow,
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.yellow,
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.yellow,
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.yellow,
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.yellow,
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.yellow,
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.yellow,
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          imageCarousel,
          Container(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          HorizontalList(),
          Container(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Recent Products",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            height: 320,
            child: Products(),
          )
        ],
      ),
    );
  }
}
