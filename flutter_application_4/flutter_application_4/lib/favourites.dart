import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/bottomNavigation.dart';
import 'package:flutter_application_4/components/laptop.dart';
import 'package:flutter_application_4/productDetail.dart';
import 'components/header.dart';

class FavouritePage extends StatelessWidget {
  String categoryTitle;

  FavouritePage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Apple Watch",
      "fotograf": "assets/images/watch.jpg",
      "fiyat": "2699"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //header
          header(categoryTitle, context),
          SizedBox(height: 32),

          //içerikler
          Expanded(
            child: GridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: products.map((Map product) {
                return buildContent(product["isim"], product["fotograf"],
                    product["fiyat"], context);
              }).toList(),
            ),
          )
        ]),
      ),

      //bottom nagivation
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      if (photoUrl == "assets/images/laptop.jpg") {
        Navigator.push(context!, MaterialPageRoute(builder: (context) {
          return LaptopPage("Bilgisayar");
        }));
      } else {
        Navigator.push(context!, MaterialPageRoute(builder: (context) {
          return ProductDetailPage(title);
        }));
      }
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Image.asset(photoUrl),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Color(0xFF0A1034),
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
              Text("$price TL",
                  style: TextStyle(
                    color: Color(0xFF0001FC),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ],
      ),
    ),
  );
}
