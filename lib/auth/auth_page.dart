import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../nav/nav_cubit.dart';
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
            print('authenticated');
            BlocProvider.of<NavCubit>(context).showHome();
            return Container();
          } else if (state.status == AuthStatus.authenticating) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == AuthStatus.initial) {
            BlocProvider.of<AuthCubit>(context).authenticate('steve');
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        }));
  }
}
