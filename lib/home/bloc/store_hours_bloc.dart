import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StoreHours {}

class StoreHoursLoading extends StoreHours {}

class StoreHoursSuccess extends StoreHours {
  final List<StoreHours> storeHours;

  StoreHoursSuccess(this.storeHours);
}

class StoreHoursFailure extends StoreHours {
  final Exception exception;

  StoreHoursFailure(this.exception);
}

class StoreHoursCubit extends Cubit<StoreHours> {
  StoreHoursCubit() : super(StoreHoursLoading());
}
