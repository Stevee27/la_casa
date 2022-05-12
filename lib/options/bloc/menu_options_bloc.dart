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
  Set<Option>? selectedOptions;

  OptionsState({this.status, this.options, this.selectedOptions});

  OptionsState copyWith({
    OptionStatus? status,
    List<Option>? options,
    Set<Option>? selectedOptions,
  }) {
    return OptionsState(
      status: status ?? this.status,
      options: options ?? this.options,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
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
        state.selectedOptions = <Option>{};
      }
      emit(state.copyWith(status: OptionStatus.loading));
      final options = await _optionsRepository.getOptionsForMenuItem(menuItem);

      emit(state.copyWith(status: OptionStatus.success, options: options));
    } catch (e) {
      emit(state.copyWith(status: OptionStatus.error));
    }
  }

  void clearOptionsForMenuItem(String selectedID) async {
    if (state.status == OptionStatus.success) {
      try {
        emit(state.copyWith(
          selectedOptions: <Option>{},
        ));
      } catch (e) {
        rethrow;
      }
    }
  }

  void selectOption(Option selectedOption) async {
    if (state.status == OptionStatus.success) {
      try {
        state.selectedOptions!.contains(selectedOption)
            ? state.selectedOptions!.remove(selectedOption)
            : state.selectedOptions!.add(selectedOption);
        emit(state.copyWith(
          status: OptionStatus.selected,
          selectedOptions: state.selectedOptions,
        ));
      } catch (e) {
        rethrow;
      }
    }
  }

  void reloadSelected(List<Option> selectedOptions) {
    emit(state.copyWith(selectedOptions: Set.from(selectedOptions)));
    print("RELOAD SELECTED");
  }

  bool getValue(Option selectedOption) {
    return state.selectedOptions == null ? false : state.selectedOptions!.contains(selectedOption);
  }

  double getOptionsPrice() {
    var arr = state.options!
        .where((o) => state.selectedOptions!.contains(o))
        .map((e) => e.price == null ? 0 : double.parse(e.price!));
    // .toList();
    double sum = 0;
    for (var p in arr) {
      sum += p;
    }
    return sum;
  }

  List<Option> getSelectedOptions() {
    return state.selectedOptions!.toList();
  }
}
