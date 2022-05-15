import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/cart/bloc/cart_bloc.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: ((context, state) {
      double total = 0.0;
      for (CartItem item in state.items) {
        total += double.parse(item.price);
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('clear');
                  BlocProvider.of<CartCubit>(context).clearAll();
                },
                child: const Text('Clear All')),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('order');
                },
                child: const Text('Order'))
          ],
        ),
      );
    }));
  }
}
