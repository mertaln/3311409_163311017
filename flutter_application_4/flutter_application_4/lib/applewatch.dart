import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/label.dart';
import 'components/header.dart';
import 'package:flutter_application_4/components/bottomNavigation.dart';

class ApplePage extends StatefulWidget {
  String productTitle;

  ApplePage(this.productTitle);

  @override
  _ApplePage createState() => _ApplePage();
}

class _ApplePage extends State<ApplePage> {
  Color? selectedColor;
  int? selectedKapasite = 64;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  List<int> Kapasiteleri = [2, 4, 6];
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Yeni Etiketim
                    ////label("Yeni"),

                    SizedBox(height: 0),

                    //Ürünün Fotoğrafı

                    Center(child: Image.asset("assets/images/watch.jpg")),
                    SizedBox(height: 30),

                    //Renk Seçenekleri
                    Text(
                      textAlign: TextAlign.center,
                      "Renk Seçenekleri",
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
                    //  SizedBox(height: 32),
                    // Text(
                    //   "Kapasiteleri",
                    //   textAlign: TextAlign.center,
                    //  style: TextStyle(
                    //      fontSize: 20,
                    //     fontWeight: FontWeight.w600,
                    //     color: Color(0xFF0A1034)),
                    //  ),

                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: Kapasiteleri.map((int number) => capacityOption(
                          kapasite: number,
                          selected: selectedKapasite == number,
                          onTap: () {
                            setState(() {
                              selectedKapasite = number;
                            });
                          })).toList(),
                    ),
                    SizedBox(height: 32),

                    //Sepete Ekle Butonu
                    GestureDetector(
                      onTap: () {
                        print("Ürün sepete eklendi.");
                        print("Ürünün ismi: " + widget.productTitle);
                        print("Ürünün kapasitesi : " +
                            selectedKapasite.toString() +
                            "GB");
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xff1f53e4),
                        ),
                        child: Text(
                          "Sepete Ekle",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ])),
      bottomNavigationBar("cart"),
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

Widget capacityOption(
    {int? kapasite, bool? selected, final VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$kapasite GB",
        style: TextStyle(
            color: Color(selected! ? 0xFF0001FC : 0xFFA7A9BE), fontSize: 16),
      ),
    ),
  );
}
