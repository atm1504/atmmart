import 'package:flutter/material.dart';

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
//                  child: Image(
//                    width: 60,
//                    height: 60,
//                    image: NetworkImage(
//                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
//                  ),
//
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
    );
  }
}
