import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_caption: "T-Shirt",
            image_url:
                "https://i.pinimg.com/originals/03/bb/19/03bb19fb6e1d7cd7ed5b4ce4ab4aed9e.png",
          ),
          Category(
            image_caption: "Dress",
            image_url:
                "https://i.pinimg.com/736x/3a/d4/6c/3ad46ca24a791fa84db046cb865606d0.jpg",
          ),
          Category(
            image_caption: "Pants",
            image_url:
                "https://library.kissclipart.com/20180829/shw/kissclipart-jeans-icon-flat-clipart-jeans-computer-icons-pants-d6f937d2b5b5c61d.jpg",
          ),
          Category(
            image_caption: "Jeans",
            image_url:
                "https://www.epicentrofestival.com/wp-content/uploads/2019/11/Jeans-T-Shirt-Denim-Clip-Art-Jeans-720x832.jpg",
          ),
          Category(
            image_caption: "Formal",
            image_url:
                "https://library.kissclipart.com/20190929/ase/kissclipart-cartoon-formal-wear-male-suit-standing-11b46200f7ffc57a.png",
          ),
          Category(
            image_caption: "Frok",
            image_url:
                "https://img.clipartlook.com/dress-clip-art-dress-clipart-276_298.png",
          ),
          Category(
            image_caption: "Salwar",
            image_url:
                "https://toppng.com/uploads/preview/salwar-suit-png-dress-11563048163nnpjglqhho.png",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_url;
  final String image_caption;
  Category({this.image_url, this.image_caption}); //Initialized the constructor
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 90,
          child: Column(
            children: <Widget>[
              Image.network(
                image_url,
                width: 100,
                height: 60,
              ),
              Text(image_caption),
            ],
          ),
        ),
      ),
    );
  }
}
