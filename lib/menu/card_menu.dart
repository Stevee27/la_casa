import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/MenuItem.dart';
import '../nav/nav_cubit.dart';

class CardMenu extends StatelessWidget {
  final String subtitle;
  final List<MenuItem> menuItems;
  final bool hasName;

  const CardMenu({Key? key, required this.subtitle, required this.menuItems, this.hasName = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        _menuHeader(subtitle),
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => BlocProvider.of<NavCubit>(context)
                          .showItem(menuItems, menuItems[index].id),
                      child: Card(
                          elevation: 4,
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(children: [
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (menuItems[index].name!.isNotEmpty)
                                            Text(menuItems[index].name!,
                                                style:
                                                    const TextStyle(fontWeight: FontWeight.w700)),
                                          Text(menuItems[index].description!,
                                              style: !hasName
                                                  ? const TextStyle(fontWeight: FontWeight.w500)
                                                  : null)
                                        ])),
                                const SizedBox(width: 10),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      menuItems[index].smallPrice!,
                                      textAlign: TextAlign.right,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      menuItems[index].price!,
                                      textAlign: TextAlign.right,
                                    )),
                              ]))));
                })),
      ]),
    );
  }

  Widget _menuHeader(String subtitle) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            color: Colors.pink,
            child: Row(children: [
              Text(subtitle,
                  textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.w500)),
              const Spacer(),
              const Text('Small  Large'),
            ])));
  }
}
