import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/User.dart';

class AuthRepository {
  authenticate(String username) async {
    final users = await Amplify.DataStore.query(User.classType, where: User.USERNAME.eq(username));
    if (users.isEmpty) return null;
    return users[0];
  }
}
