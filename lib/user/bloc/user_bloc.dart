import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/auth/bloc/auth_bloc.dart';
import 'package:la_casa/user/user_repository.dart';

import '../../models/User.dart';

enum UserStatus { initial, success, error, loading }

class UserState extends Equatable {
  final UserStatus? status;
  final User? user;

  const UserState({this.user, this.status});

  UserState copyWith({UserStatus? status, User? user}) {
    var u = UserState(status: status ?? this.status, user: user ?? this.user);
    return u;
  }

  @override
  List<Object?> get props => [status, user];
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState(status: UserStatus.initial));

  final _userRepository = UserRepository();

  Future<void> createUser(User user) async {
    await _userRepository.createUser(user);
  }

  Future<void> updateUser(User user) async {
    await _userRepository.updateUser(user);
  }

  Future<void> getUser(String? userName) async {
    if (userName != null) {
      try {
        emit(state.copyWith(status: UserStatus.loading));
        final user = await _userRepository.getUser(userName);

        emit(state.copyWith(status: UserStatus.success, user: user));
      } catch (e) {
        emit(state.copyWith(status: UserStatus.error));
      }
    }
  }

  void clearUser() {
    emit(const UserState(status: UserStatus.initial));
  }
}
