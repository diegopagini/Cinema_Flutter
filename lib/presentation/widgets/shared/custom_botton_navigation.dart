import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.label_outline), label: 'Categories'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), label: 'Favorites'),
    ]);
  }
}
