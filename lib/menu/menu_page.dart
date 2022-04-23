import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu/bloc/menu_bloc.dart';
import 'package:la_casa/menu/menu_layout.dart';

import '../casa_error_widget.dart';
import '../loading_view.dart';

class MenuPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("MenuPage");
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(builder: (context, state) {
      if (state is MenuSuccess) {
        if (state.menuItems.isEmpty) {
          return Container();
        } else {
          return MenuLayout(menuItems: state.menuItems);
        }
      } else if (state is MenuFailure) {
        return CasaErrorWidget(exception: state.exception);
      } else {
        return const LoadingView();
      }
    });
  }
}
