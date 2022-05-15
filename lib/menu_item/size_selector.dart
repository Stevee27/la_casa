import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu_item/pricer.dart';

import '../models/MenuItem.dart';
import '../options/bloc/menu_options_bloc.dart';

class SizeSelector extends StatelessWidget {
  final MenuItem menuItem;

  const SizeSelector({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (menuItem.price!.isNotEmpty && menuItem.smallPrice!.isNotEmpty) {
      return BlocBuilder<OptionsCubit, OptionsState>(builder: (context, state) {
        return Row(children: <Widget>[
          const Spacer(flex: 10),
          const Text('Small', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Radio<ItemSize>(
            groupValue: state.selectedSize,
            value: ItemSize.small,
            onChanged: (value) {
              BlocProvider.of<OptionsCubit>(context).selectSize(value!);
            },
          ),
          const Spacer(flex: 1),
          const Text('Large', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Radio<ItemSize>(
            groupValue: state.selectedSize,
            value: ItemSize.large,
            onChanged: (value) {
              BlocProvider.of<OptionsCubit>(context).selectSize(value!);
            },
          ),
        ]);
      });
    }
    return Container();
  }
}
