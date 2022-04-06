import 'package:flutter/material.dart';
import 'package:flutter_application_4/categories.dart';
import 'package:flutter_application_4/components/bottomNavigation.dart';
import 'package:flutter_application_4/components/label.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              //Başlık
              buildBaslik(),
              //Banner
              buildBanner(),
              //Butonlar
              Padding(
                padding: EdgeInsets.only(top: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // İlk elemanım
                    buildNavigation(
                        text: "Kategoriler",
                        icon: Icons.menu,
                        widget: CategoriesPage(),
                        context: context),
                    buildNavigation(text: "Favoriler", icon: Icons.star_border),
                    buildNavigation(
                        text: "Hediyeler", icon: Icons.card_giftcard),
                    buildNavigation(text: "Çok Satanlar", icon: Icons.people),
                  ],
                ),
              ),
              //İndirimler

              SizedBox(height: 40),
              Text(
                "İndirimler",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF0A1034)),
              ),
              SizedBox(height: 16),
              // Akıllı telefon resmi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildIndirimler(
                    text: "Akıllı Telefonlar",
                    photoUrl: "assets/images/telefon.jpg",
                    discount: "-%50",
                    screenWidth: screenWidth,
                  ),
                  buildIndirimler(
                    text: "Akıllı Telefonlar",
                    photoUrl: "assets/images/telefon.jpg",
                    discount: "-%50",
                    screenWidth: screenWidth,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildIndirimler(
                    text: "Akıllı Telefonlar",
                    photoUrl: "assets/images/telefon.jpg",
                    discount: "-%50",
                    screenWidth: screenWidth,
                  ),
                  buildIndirimler(
                    text: "Akıllı Telefonlar",
                    photoUrl: "assets/images/telefon.jpg",
                    discount: "-%50",
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ]),
          ),
          // Navigasyon Barı
          bottomNavigationBar("home"),
        ],
      ),
    ));
  }
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBanner() {
  return //Banner
      Padding(
    padding: EdgeInsets.only(top: 24),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color(0xFF0001FC), borderRadius: BorderRadius.circular(6)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Speaker",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              "279 TL",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset("assets/images/speaker.jpg"),
          height: 120,
          width: 250,
        ),
      ]),
    ),
  );
}

Widget buildNavigation({
  required String text,
  required IconData icon,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return widget!;
          },
        ),
      );
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0xFF0001FC),
            size: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(text,
            style: TextStyle(
                color: Color(0xFF1F53E4),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      ],
    ),
  );
}

Widget buildIndirimler({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenWidth,
}) {
  var width;
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),
        SizedBox(height: 22),
        Image.asset(photoUrl),
        SizedBox(height: 22),
        Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
          ),
        )
      ],
    ),
  );
}
