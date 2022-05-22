import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu_item/pricer.dart';

import '../cart/bloc/cart_bloc.dart';
import '../models/MenuItem.dart';

class SizeSelector extends StatelessWidget {
  final MenuItem menuItem;
  // final CartItem currentCartItem;

  const SizeSelector({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: ((context, state) {
      if (state.reloadedCartItem != null) {
        if (menuItem.price!.isNotEmpty && menuItem.smallPrice!.isNotEmpty) {
          return Row(children: <Widget>[
            const Spacer(flex: 10),
            const Text('Small', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Radio<ItemSize>(
              groupValue: state.reloadedCartItem!.selectedSize,
              value: ItemSize.small,
              onChanged: (value) {
                BlocProvider.of<CartCubit>(context).selectSize(value!);
              },
            ),
            const Spacer(flex: 1),
            const Text('Large', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Radio<ItemSize>(
              groupValue: state.reloadedCartItem!.selectedSize,
              value: ItemSize.large,
              onChanged: (value) {
                BlocProvider.of<CartCubit>(context).selectSize(value!);
              },
            ),
          ]);
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    }));
  }
}
