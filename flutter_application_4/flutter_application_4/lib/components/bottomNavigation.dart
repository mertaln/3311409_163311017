import "package:flutter/material.dart";

Widget bottomNavigationBar(String page) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      color: Color(0xFFEFF5FB),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(iconData: Icons.home_filled, active: page == "home"),
          buildNavIcon(iconData: Icons.search, active: page == "search"),
          buildNavIcon(iconData: Icons.shopping_basket, active: page == "cart"),
          buildNavIcon(iconData: Icons.person, active: page == "profile"),
        ],
      ),
    ),
  );
}

Widget buildNavIcon({required IconData iconData, required bool active}) {
  return Icon(
    iconData,
    size: 26,
    color: Color(active ? 0xFF0001FC : 0xFF0A1034),
  );
}
