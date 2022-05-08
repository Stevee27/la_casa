import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';
import '../nav/nav_cubit.dart';
import 'user_form.dart';

class UserPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("UserPage");

  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/images/name.jpg'),
                    fit: BoxFit.fitWidth))),
        backgroundColor: Colors.white70,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(builder: ((context, state) {
        if (state.status == AuthStatus.authenticated) {
          return Column(
            children: const [
              Spacer(),
              Text('User Profile', style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              UserForm(),
              Spacer(flex: 10),
            ],
          );
          // return Center(child: Text('Hello ${state.user!.firstName}'));
        }
        throw Exception('No Authenticated User');
      })),
      bottomNavigationBar: BottomNavigationBar(
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
            label: 'SHow Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 3,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber[800],
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
      ),
    );
  }
}
