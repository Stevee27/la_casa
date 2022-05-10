import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/nav_cubit.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;

  const NavBar(
    this.currentIndex, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_restaurant),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Show Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.amber[800],
      showUnselectedLabels: true,
      onTap: (i) async {
        switch (i) {
          case 0:
            BlocProvider.of<NavCubit>(context).showHome();
            break;
          case 1:
            BlocProvider.of<NavCubit>(context).showMenu();
            break;
          case 2:
            BlocProvider.of<NavCubit>(context).showCart();
            break;
          case 3:
            BlocProvider.of<NavCubit>(context).showUser();
            break;
        }
      },
    );
  }
}
