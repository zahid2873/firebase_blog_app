import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_blog_app/screen/details_page.dart';
import 'package:firebase_blog_app/screen/gallery_page.dart';
import 'package:firebase_blog_app/screen/popular.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List myPages = [DetailsPage(),PopularPgae(),GalleryPage()];
  var indexpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bolg App"),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.details, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.photo_album, size: 30),
        ],
        onTap: (index) {
          indexpage = index;
          //Handle button tap
        },
      ),
    );
  }
}
