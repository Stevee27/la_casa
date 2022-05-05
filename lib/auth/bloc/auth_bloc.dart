import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/User.dart';
import '../auth_repository.dart';

enum AuthStatus { initial, authenticating, unauthenticated, authenticationFail, authenticated, error }

class AuthState extends Equatable {
  final AuthStatus? status;
  final User? user;

  const AuthState({this.user, this.status});

  AuthState copyWith({AuthStatus? status, User? user}) {
    var u = AuthState(status: status ?? this.status, user: user ?? this.user);
    return u;
  }

  @override
  List<Object?> get props => [status, user];
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState(status: AuthStatus.unauthenticated));

  final _authRepository = AuthRepository();

  void authenticate(username) async {
    try {
      emit(state.copyWith(status: AuthStatus.authenticating));
      final user = await _authRepository.authenticate(username);
      if (user != null) {
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      } else {
        emit(state.copyWith(status: AuthStatus.authenticationFail, user: user));
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }
  // await Future.delayed(const Duration(milliseconds: 1000))
  //     .then((value) => emit(state.copyWith(status: AuthStatus.authenticating)));
  // print('authenticating');
  // Future.delayed(const Duration(milliseconds: 2000))
  //     .then((value) => emit(state.copyWith(status: AuthStatus.authenticated)));
  // }

  void createUser(User user) async {
    // await _userRepository.createUser(user);
  }

  void updateUser(User user) async {
    // await _userRepository.updateUser(user);
  }

  void getUser(String userName) async {
    // try {
    //   emit(state.copyWith(status: UserStatus.loading));
    //   final user = await _userRepository.getUser(userName);

    //   emit(state.copyWith(status: UserStatus.success, user: user));
    // } catch (e) {
    //   emit(state.copyWith(status: UserStatus.error));
    // }
  }
}
