import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Option.dart';
import '../menu_item_repository.dart';

enum MenuItemStatus { initial, success, error, loading, selected, reloading }

extension MenuItemStatusX on MenuItemStatus {
  bool get isInitial => this == MenuItemStatus.initial;
  bool get isSuccess => this == MenuItemStatus.success;
  bool get isError => this == MenuItemStatus.error;
  bool get isLoading => this == MenuItemStatus.loading;
  bool get isSelected => this == MenuItemStatus.selected;
}

// ignore: must_be_immutable
class MenuItemState extends Equatable {
  final MenuItemStatus? status;
  final List<Option>? options;
  Set<String>? selectedOptions;
  String? optionPrice;
  // Map<String, double> optionPriceMap = {};

  MenuItemState({this.status, this.options, this.selectedOptions, this.optionPrice});

  MenuItemState copyWith({MenuItemStatus? status, String? optionPrice, Set<String>? selectedOptions}) {
    return MenuItemState(
        status: status ?? this.status,
        optionPrice: optionPrice ?? this.optionPrice,
        selectedOptions: selectedOptions ?? this.selectedOptions);
  }

  @override
  List<Object?> get props => [status, options, selectedOptions];
}

class MenuItemCubit extends Cubit<MenuItemState> {
  MenuItemCubit() : super(MenuItemState(status: MenuItemStatus.initial));

  final _itemsRepository = MenuItemRepository();

  void reloadOptions(List<Option> selectedOptions) {
    // emit();
  }

  void optionPriceAdded(Option option) {}
  void selectOption(String selectedID, String? optionPrice) async {}
}
