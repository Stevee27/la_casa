import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/auth/auth_layout.dart';

import '../models/User.dart';
import '../nav/bloc/nav_cubit.dart';
import '../user/bloc/user_bloc.dart';
import '../utils/some_users.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("AuthPage");

  const AuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/name.jpg'),
                      fit: BoxFit.fitWidth))),
          backgroundColor: Colors.white70,
        ),
        body: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            if (state.user != null) BlocProvider.of<UserCubit>(context).getUser(state.user!.userName);
            BlocProvider.of<NavCubit>(context).showHome();
            return Container();
          } else if (state.status == AuthStatus.unauthenticated) {
            BlocProvider.of<UserCubit>(context).clearUser();
            // _createSomeUsers(context);
            return AuthLayout();
          } else if (state.status == AuthStatus.authenticationFail) {
            return AuthLayout(failure: true);
          } else if (state.status == AuthStatus.authenticating) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == AuthStatus.initial) {
            BlocProvider.of<AuthCubit>(context).authenticate('steve');
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        }));
  }

  _createSomeUsers(context) async {
    for (User user in someUsers) {
      print(user);
      BlocProvider.of<UserCubit>(context).createUser(user);
    }
  }
}
