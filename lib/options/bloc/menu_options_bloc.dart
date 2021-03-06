import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../menu_item/pricer.dart';
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
  final List<Option>? allOptions;
  Set<Option>? selectedOptions;
  ItemSize? selectedSize;

  OptionsState({this.status, this.options, this.selectedOptions, this.allOptions, this.selectedSize});

  OptionsState copyWith(
      {OptionStatus? status,
      List<Option>? options,
      final List<Option>? allOptions,
      Set<Option>? selectedOptions,
      ItemSize? selectedSize}) {
    return OptionsState(
      status: status ?? this.status,
      options: options ?? this.options,
      allOptions: allOptions ?? this.allOptions,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }

  @override
  List<Object?> get props => [status, options, selectedOptions, selectedSize];
}

class OptionsCubit extends Cubit<OptionsState> {
  OptionsCubit() : super(OptionsState(status: OptionStatus.initial));

  final _optionsRepository = OptionsRepository();

  Future<void> getOptions() async {
    try {
      if (state.status == OptionStatus.initial) {
        state.selectedOptions = <Option>{};
        final allOptions = await _optionsRepository.getOptions();
        emit(state.copyWith(status: OptionStatus.loading, allOptions: allOptions));
      }
    } catch (e) {
      emit(state.copyWith(status: OptionStatus.error));
    }
  }

  void getOptionsForMenuItem(MenuItem menuItem, {syncSize = true}) async {
    try {
      if (state.status == OptionStatus.initial) {
        await getOptions();
      }
      final options = state.allOptions!.where((o) => o.menuType == menuItem.menuType).toList();
      final size = menuItem.price!.isEmpty ? ItemSize.small : ItemSize.large;
      var itemSize = syncSize ? state.selectedSize ?? size : size;

      emit(state.copyWith(status: OptionStatus.success, options: options, selectedSize: itemSize));
    } catch (e) {
      emit(state.copyWith(status: OptionStatus.error));
    }
  }

  Future<void> clearOptionsForMenuItem() async {
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

  Future<void> clearSelectedSize(MenuItem menuItem) async {
    try {
      emit(state.copyWith(
        selectedSize: menuItem.price!.isNotEmpty ? ItemSize.large : ItemSize.small,
      ));
    } catch (e) {
      rethrow;
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

  void reloadSelected(CartItem cartItem) async {
    var menuItem = cartItem.menuItem;
    getOptionsForMenuItem(menuItem);
    // await getOptionsForMenuItem(menuItem);
    emit(state.copyWith(selectedOptions: Set.from(cartItem.options), selectedSize: cartItem.selectedSize));
    // print("RELOAD SELECTED");
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

  void selectSize(ItemSize itemSize) {
    emit(state.copyWith(selectedSize: itemSize));
  }
}
