import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';
import 'user_form.dart';

class UserPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("UserPage");

  const UserPage({Key? key}) : super(key: key);
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
        body: BlocBuilder<AuthCubit, AuthState>(builder: ((context, state) {
          if (state.status == AuthStatus.authenticated) {
            return UserForm();
            // return Center(child: Text('Hello ${state.user!.firstName}'));
          }
          throw Exception('No Authenticated User');
        })));
  }
}
