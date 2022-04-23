import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu/menu_repository.dart';
import 'package:la_casa/models/MenuItem.dart';

abstract class MenuState {}

class MenuLoading extends MenuState {}

class MenuSuccess extends MenuState {
  final List<MenuItem> menuItems;

  MenuSuccess(this.menuItems);
}

class MenuFailure extends MenuState {
  final Exception exception;

  MenuFailure(this.exception);
}

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuLoading());

  final _menuRepository = MenuRepository();

  void getMenu() async {
    if (state is MenuSuccess == false) emit(MenuLoading());
    try {
      final menuItems = await _menuRepository.getMenuItems();
      emit(MenuSuccess(menuItems));
    } catch (e) {
      emit(MenuFailure(e as Exception));
    }
  }

  Future<void> creatMenuItem(MenuItem menuItem) async {
    await _menuRepository.createMenuItem(menuItem);
  }

  Future<void> updateMenuItem(MenuItem menuItem) async {
    await _menuRepository.updateMenuItem(menuItem);
  }
}
