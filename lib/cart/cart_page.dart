import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("CartPage");

  const CartPage({Key? key}) : super(key: key);

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
        body: BlocProvider(
            create: (BuildContext context) => CartCubit(),
            child: BlocBuilder<CartCubit, CartState>(builder: ((context, state) {
              if (state.status == CartStatus.success) {
                return Container();
              } else {
                return const Center(child: Text('You have no orders in cart.'));
              }
            }))));
  }
}
