import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/home/bloc/store_hours_bloc.dart';
import 'package:la_casa/home/home_layout.dart';
import 'package:la_casa/home/home_repository.dart';
import 'package:la_casa/loading_view.dart';

class HomePage extends StatelessWidget {
  static const valueKey = ValueKey<String>("HomePage");

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreHoursCubit, StoreHoursState>(builder: (context, state) {
      if (state is StoreHoursSuccess) {
        if (state.storeHours.isEmpty) {
          BlocProvider.of<StoreHoursCubit>(context).creatStoreHours(intialStoreHoursArray);
          return Container();
        } else {
          return HomeLayout(storeHours: state.storeHours);
        }
      } else if (state is StoreHoursFailure) {
        return _exceptionView(state.exception);
      } else {
        return LoadingView();
      }
    });
  }

  Widget _exceptionView(Exception e) {
    return Center(
      child: Text(e.toString()),
    );
  }
}
