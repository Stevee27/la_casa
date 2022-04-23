import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/home/home_repository.dart';
import 'package:la_casa/models/StoreHours.dart';

abstract class StoreHoursState {}

class StoreHoursLoading extends StoreHoursState {}

class StoreHoursSuccess extends StoreHoursState {
  final List<StoreHours> storeHours;

  StoreHoursSuccess(this.storeHours);
}

class StoreHoursFailure extends StoreHoursState {
  final Exception exception;

  StoreHoursFailure(this.exception);
}

class StoreHoursCubit extends Cubit<StoreHoursState> {
  StoreHoursCubit() : super(StoreHoursLoading());

  final _homeRepository = HomeRepository();

  void getStoreHours() async {
    if (state is StoreHoursSuccess == false) emit(StoreHoursLoading());
    try {
      final storeHours = await _homeRepository.getStoreHours();
      emit(StoreHoursSuccess(storeHours));
    } catch (e) {
      emit(StoreHoursFailure(e as Exception));
    }
  }

  void creatStoreHours(List<StoreHours> storeHours) async {
    print("hello");
    await _homeRepository.creatStoreHours(storeHours);
  }

  void updateStoreHoursComplete(StoreHours storeHours) {}
}
