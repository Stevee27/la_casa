import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/User.dart';

class UserRepository {
  Future<void> createUser(User user) async {
    await Amplify.DataStore.save(user);
  }

  Future<void> updateUser(User user) async {
    await Amplify.DataStore.save(user);
  }

  Future<User> getUser(String username) async {
    final users = await Amplify.DataStore.query(User.classType, where: User.USERNAME.eq(username));
    return users[0];
  }
}
