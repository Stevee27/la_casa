import '../models/Roles.dart';
import '../models/User.dart';

List<User> someUsers = [
  User(userName: 'steve', firstName: 'Steve', lastName: 'Messing', role: Roles.ADMIN),
  User(userName: 'anna', firstName: 'Anna', lastName: 'Clemens', role: Roles.ADMIN),
  User(userName: 'maddy', firstName: 'Maddalena', lastName: 'Clemens', role: Roles.USER),
];
