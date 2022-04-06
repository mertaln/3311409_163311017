import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/label.dart';
import 'components/header.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color? selectedColor;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //header
            header(widget.productTitle, context),
            SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  //Yeni Etiketim

                  label("Yeni"),
                  SizedBox(height: 25),
                  Image.asset("assets/images/iphone.jpg"),

                  SizedBox(height: 30),

                  //Renk Seçenekleri
                  Text(
                    "Color",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A1034)),
                  ),

                  SizedBox(height: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: colors
                          .map((Color color) => colorOption(
                              color: color,
                              selected: selectedColor == color,
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              }))
                          .toList()),

                  //Kapasiteleri

                  //Sepete Ekle Butonu
                ],
              ),
            ),
          ]))
    ])));
  }
}

Widget colorOption({Color? color, bool? selected, final VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
            color: const Color(0xFF0001FC), width: selected! ? 3 : 0),
      ),
      width: 23,
      height: 23,
    ),
  );
}
