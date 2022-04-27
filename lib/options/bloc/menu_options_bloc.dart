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

class OptionsState extends Equatable {
  final OptionStatus? status;
  final List<Option>? options;
  final String? selectedID;

  const OptionsState({this.status, this.options, this.selectedID});

  OptionsState copyWith({
    OptionStatus? status,
    List<Option>? options,
    String? selectedID,
  }) {
    return OptionsState(
        status: status ?? this.status,
        options: options ?? this.options,
        selectedID: selectedID ?? this.selectedID);
  }

  @override
  List<Object?> get props => [status, options, selectedID];
}

class OptionsCubit extends Cubit<OptionsState> {
  OptionsCubit() : super(const OptionsState(status: OptionStatus.initial));

  final _optionsRepository = OptionsRepository();

  void getOptionsForMenuItem(MenuItem menuItem) async {
    try {
      emit(state.copyWith(status: OptionStatus.loading));
      final options = await _optionsRepository.getOptionsForMenuItem(menuItem);

      emit(state.copyWith(status: OptionStatus.success, options: options));
    } catch (e) {
      emit(state.copyWith(status: OptionStatus.error));
    }
  }

  void selectOption(Option selectedOption) async {
    if (state.status == OptionStatus.success) {
      try {
        emit(state.copyWith(status: OptionStatus.selected, selectedID: selectedOption.id));
      } catch (e) {
        rethrow;
      }
    }
  }
}
