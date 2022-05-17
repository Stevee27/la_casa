import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/cart/cart_checkout.dart';
import 'package:la_casa/menu/bloc/menu_bloc.dart';
import 'package:la_casa/menu_item/pricer.dart';
import 'package:la_casa/utils/widgets/loading_view.dart';

import '../models/MenuItem.dart';
import '../models/Option.dart';
import '../nav/bloc/nav_cubit.dart';
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
        if (state.status == CartStatus.success || state.status == CartStatus.editting) {
          if (state.items.isNotEmpty) {
            return Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              onLongPress: () {
                                print(state.items[index]);
                                var menu = BlocProvider.of<MenuCubit>(context).getCurrentMenu();
                                BlocProvider.of<CartCubit>(context).reloadMenuItemOptions(state.items[index]);
                                BlocProvider.of<NavCubit>(context)
                                    .editMenuItem(menu, state.items[index].menuItem);
                              },
                              isThreeLine: true,
                              title: (state.items[index].menuItem.name!.isNotEmpty)
                                  ? Text('${state.items[index].menuItem.name!}')
                                  : Text(
                                      '${state.items[index].menuItem.description!}  ${_itemComment(state.items[index])}'),
                              subtitle: (state.items[index].menuItem.name!.isNotEmpty)
                                  ? Text(
                                      '${state.items[index].menuItem.description!}\nOptions: ${_makeOptionListing(state.items[index].options)}\n\$${state.items[index].price}    ${_itemComment(state.items[index])}')
                                  : Text(
                                      'Options: ${_makeOptionListing(state.items[index].options)}\n\$${state.items[index].price}    ${_itemComment(state.items[index])}'),
                              trailing: TextButton(
                                  child: const Icon(Icons.highlight_remove_sharp),
                                  onPressed: () {
                                    BlocProvider.of<CartCubit>(context).removeItem(state.items[index]);
                                  }));
                        }),
                  ),
                ),
                const CartCheckout()
              ],
            );
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

  String _makeOptionListing(List<Option> options) {
    if (options.isEmpty) {
      return 'none';
    } else {
      return (options.map((o) => o.name).toList()).join(', ');
    }
  }

  String _itemComment(CartItem cartItem) {
    var menuItem = cartItem.menuItem;
    if (menuItem.smallPrice!.isNotEmpty && menuItem.price!.isNotEmpty) {
      if (cartItem.selectedSize == ItemSize.large) {
        return 'LARGE';
      } else if (cartItem.selectedSize == ItemSize.small) {
        return 'SMALL';
      }
    }
    return '';
  }
}
