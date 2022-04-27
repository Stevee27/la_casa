import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/MenuItem.dart';
import '../../models/Option.dart';
import '../options_repository.dart';

enum OptionStatus { initial, success, error, loading, selected }

extension OptionStatusX on OptionStatus {
  bool get isInitial => this == OptionStatus.initial;
  bool get isSuccess => this == OptionStatus.success;
  bool get isError => this == OptionStatus.error;
  bool get isLoading => this == OptionStatus.loading;
  bool get isSelected => this == OptionStatus.selected;
}

// ignore: must_be_immutable
class OptionsState extends Equatable {
  final OptionStatus? status;
  final List<Option>? options;
  Set<String>? selectedOptions;

  OptionsState({this.status, this.options, this.selectedOptions});

  OptionsState copyWith(
      {OptionStatus? status, List<Option>? options, Set<String>? selectedOptions}) {
    return OptionsState(
        status: status ?? this.status,
        options: options ?? this.options,
        selectedOptions: selectedOptions ?? this.selectedOptions);
  }

  @override
  List<Object?> get props => [status, options, selectedOptions];
}

class OptionsCubit extends Cubit<OptionsState> {
  OptionsCubit() : super(OptionsState(status: OptionStatus.initial));

  final _optionsRepository = OptionsRepository();

  void getOptionsForMenuItem(MenuItem menuItem) async {
    try {
      if (state.status == OptionStatus.initial) {
        state.selectedOptions = <String>{};
      }
      emit(state.copyWith(status: OptionStatus.loading));
      final options = await _optionsRepository.getOptionsForMenuItem(menuItem);

      emit(state.copyWith(status: OptionStatus.success, options: options));
    } catch (e) {
      emit(state.copyWith(status: OptionStatus.error));
    }
  }

  void selectOption(String selectedID) async {
    if (state.status == OptionStatus.success) {
      try {
        state.selectedOptions!.contains(selectedID)
            ? state.selectedOptions!.remove(selectedID)
            : state.selectedOptions!.add(selectedID);
        emit(state.copyWith(status: OptionStatus.selected, selectedOptions: state.selectedOptions));
      } catch (e) {
        rethrow;
      }
    }
  }

  bool getValue(String selectedID) {
    return state.selectedOptions == null ? false : state.selectedOptions!.contains(selectedID);
  }
}
