import 'package:flutter/material.dart';
import 'package:la_casa/models/MenuItem.dart';

class MenuLayout extends StatelessWidget {
  final List<MenuItem> menuItems;
  const MenuLayout({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/name.jpg'),
                      fit: BoxFit.fitWidth))),
          backgroundColor: Colors.white70,
        ),
        body: const Center(child: Text('Menu Page')));
  }
}
