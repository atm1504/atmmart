import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_caption: "T-Shirt",
            image_url:
                "https://i.pinimg.com/originals/03/bb/19/03bb19fb6e1d7cd7ed5b4ce4ab4aed9e.png",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  String image_url;
  String image_caption;
  Category({this.image_url, this.image_caption}); //Initialized the constructor
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.network(
              image_url,
              width: 100,
              height: 80,
            ),
            subtitle: Text(image_caption),
          ),
        ),
      ),
    );
  }
}
