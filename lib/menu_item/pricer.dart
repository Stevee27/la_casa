import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/MenuItem.dart';
import '../options/bloc/menu_options_bloc.dart';

enum ItemSize { small, large }

class Pricer {
  static Widget priceWidget(BuildContext context, MenuItem menuItem) {
    if (menuItem.smallPrice!.isEmpty && menuItem.price!.isNotEmpty) {
      return Text('Price: \$${_calculateTotalPrice(context, menuItem.price)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
    } else if (menuItem.price!.isEmpty && menuItem.smallPrice!.isNotEmpty) {
      return Text('Price: \$${_calculateTotalPrice(context, menuItem.smallPrice)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
    } else if (menuItem.smallPrice!.isNotEmpty && menuItem.price!.isNotEmpty) {
      return _renderMultiPriceLine(context, menuItem);
    } else {
      return const Text('');
    }
  }

  static String priceString(BuildContext context, MenuItem menuItem, {ItemSize itemSize = ItemSize.large}) {
    String? basePrice = (itemSize == ItemSize.large) ? menuItem.price : menuItem.smallPrice;
    if (basePrice != null && basePrice.isNotEmpty) return _calculateTotalPrice(context, basePrice);
    return '';
  }

  static String _calculateTotalPrice(context, String? basePrice) {
    if (basePrice != null) {
      double optionsPrice = BlocProvider.of<OptionsCubit>(context).getOptionsPrice();
      double price = 0.0;
      try {
        price = double.parse(basePrice);
      } catch (e) {
        return ("");
      }
      return (price + optionsPrice).toStringAsFixed(2);
    }
    return '';
  }

  static Widget _renderMultiPriceLine(context, MenuItem menuItem) {
    String smallPrice = _calculateTotalPrice(context, menuItem.smallPrice);
    String smallPriceString = smallPrice.isNotEmpty ? 'Small: \$$smallPrice' : '';
    String largePrice = _calculateTotalPrice(context, menuItem.price);
    String largePriceString = largePrice.isNotEmpty ? '  Large: \$$largePrice' : '';
    return Text(smallPriceString + largePriceString,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
  }
}
