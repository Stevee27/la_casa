import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/utils/widgets/loading_view.dart';

import '../nav/nav_bar.dart';
import 'bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  static const valueKey = ValueKey<String>("CartPage");

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        if (state.status == CartStatus.success) {
          if (state.items.isNotEmpty) {
            return Center(child: Text('You have ${state.items.length.toString()} items in cart.'));
          } else {
            return const Center(child: Text('You have no items in cart.'));
          }
        } else {
          return const LoadingView();
        }
      }),
      bottomNavigationBar: const NavBar(2),
    );
  }
}
