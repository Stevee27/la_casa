import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/MenuItem.dart';
import 'bloc/cart_bloc.dart';

class OrderItemCache {
  final int quantity = 1;
  late final MenuItem menuItem;
  final List<String> selectedOptionIDs;

  OrderItemCache(this.menuItem, {this.selectedOptionIDs = const []});
}

class CartPage extends StatefulWidget {
  static const valueKey = ValueKey<String>("CartPage");

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Map<String, OrderItemCache> orderItemMap = {};
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
        body: BlocConsumer<CartCubit, CartState>(listener: (BuildContext context, state) {
          if (state.status == CartStatus.adding) {}
        }, builder: ((context, state) {
          if (state.status == CartStatus.success) {
            return Container();
          } else {
            return const Center(child: Text('You have no items in cart.'));
          }
        })));
  }
}
