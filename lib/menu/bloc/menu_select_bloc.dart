import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/MenuType.dart';

abstract class MenuSelectState {}

class MenuSelectSuccess extends MenuSelectState {
  final MenuType selected;

  MenuSelectSuccess(this.selected);
}

class MenuSelectFailure extends MenuSelectState {
  final Exception exception;

  MenuSelectFailure(this.exception);
}

class MenuSelectCubit extends Cubit<MenuSelectState> {
  MenuSelectCubit() : super(MenuSelectSuccess(MenuType.BREAKFAST));

  void menuSelect(MenuType selection) {
    emit(MenuSelectSuccess(selection));
  }
}
