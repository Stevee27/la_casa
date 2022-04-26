import 'package:flutter_bloc/flutter_bloc.dart';

import '../../menu/menu_repository.dart';
import '../../models/MenuItem.dart';
import '../../models/Option.dart';
import '../options_repository.dart';

abstract class OptionsState {}

class OptionsSuccess extends OptionsState {
  final List<Option> options;

  OptionsSuccess(this.options);
}

class OptionsSelect extends OptionsState {
  final List<Option> options;
  final Option selected;

  OptionsSelect(this.options, this.selected);
}

class OptionsLoading extends OptionsState {}

class OptionsFailure extends OptionsState {
  final Exception exception;

  OptionsFailure(this.exception);
}

class OptionsCubit extends Cubit<OptionsState> {
  OptionsCubit() : super(OptionsLoading());

  final _optionsRepository = OptionsRepository();

  void getOptionsForMenuItem(MenuItem menuItem) async {
    if (state is OptionsSuccess == false) emit(OptionsLoading());
    try {
      final options = await _optionsRepository.getOptionsForMenuItem(menuItem);
      emit(OptionsSuccess(options));
    } catch (e) {
      emit(OptionsFailure(e as Exception));
    }
  }
}
