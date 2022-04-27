import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/MenuItem.dart';
import '../models/Option.dart';
import 'bloc/menu_options_bloc.dart';

class MenuOptions extends StatelessWidget {
  final MenuItem menuItem;
  final List<Option> options;

  const MenuOptions({Key? key, required this.menuItem, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (options.isNotEmpty) {
      List<Widget> optionNames = options
          .map(
            (o) => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(o.name!, style: const TextStyle(color: Colors.pink, fontSize: 16)),
                value: BlocProvider.of<OptionsCubit>(context).getValue(o.id),
                onChanged: (newValue) => BlocProvider.of<OptionsCubit>(context).selectOption(o.id)),
          )
          .toList();
      // .map((o) => Text(o.name!, style: const TextStyle(color: Colors.pink, fontSize: 1))
      return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return SizedBox(height: 50, child: optionNames[index]);
        },
      );
    }
    return Container();
  }
}
