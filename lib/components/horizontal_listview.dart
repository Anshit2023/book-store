import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
         Category(
           image_location: 'images/1.jpg',
           image_caption: 'saket',
         ),
          Category(
            image_location: 'images/1.jpg',
            image_caption: 'saket',
          ),
          Category(
            image_location: 'images/1.jpg',
            image_caption: 'saket',
          ),
          Category(
            image_location: 'images/1.jpg',
            image_caption: 'saket',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {

  final String image_location;
  final String image_caption;
  Category({this.image_location,this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(onTap: (){},
      child: Container(
        width: 80,
        child: ListTile(
          title: Image.asset(image_location,
          width: 40,
          height: 40,
          ),
          subtitle: Container(
            alignment: Alignment.center,
            child: Text(image_caption),
          ),
        ),
      ),
      ),
    );
  }
}

