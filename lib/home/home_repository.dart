import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/StoreHours.dart';

var intialStoreHoursArray = [
  StoreHours(
    order: 1,
    dayOfWeek: 'Monday',
    from: 'Closed',
    to: 'Closed',
  ),
  StoreHours(
    order: 2,
    dayOfWeek: 'Tuesday',
    from: '8:00 AM',
    to: '3:00 PM',
  ),
  StoreHours(
    order: 3,
    dayOfWeek: 'Wednesday',
    from: '8:00 AM',
    to: '3:00 PM',
  ),
  StoreHours(
    order: 4,
    dayOfWeek: 'Thursday',
    from: '8:00 AM',
    to: '3:00 PM',
  ),
  StoreHours(
    order: 5,
    dayOfWeek: 'Friday',
    from: '8:00 AM',
    to: '3:00 PM',
  ),
  StoreHours(
    order: 6,
    dayOfWeek: 'Saturday',
    from: '8:00 AM',
    to: '5:00 PM',
  ),
  StoreHours(
    order: 7,
    dayOfWeek: 'Sunday',
    from: '8:00 AM',
    to: '2:00 PM',
  ),
];

class HomeRepository {
  Future<List<StoreHours>> getStoreHours() async {
    try {
      final storeHours = await Amplify.DataStore.query(StoreHours.classType);
      return storeHours;
    } catch (e) {
      throw e as Exception;
    }
  }

  Future<void> creatStoreHours(List<StoreHours> storeHours) async {
    try {
      for (StoreHours hours in storeHours) {
        await Amplify.DataStore.save(hours);
      }
    } catch (e) {
      rethrow;
    }
    // await Future.delayed(const Duration(milliseconds: 100));
  }

  Future<void> updateStoreHoursComplete(StoreHours storeHours) async {
    try {
      await Amplify.DataStore.save(storeHours);
    } catch (e) {
      rethrow;
    }
  }
}
