import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../nav/nav_cubit.dart';
import 'bloc/user_bloc.dart';

class AuthView extends StatelessWidget {
  static const valueKey = ValueKey<String>("AuthView");

  const AuthView({Key? key}) : super(key: key);
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
        body: BlocBuilder<UserCubit, UserState>(builder: ((context, state) {
          if (state.status == UserStatus.success) {
            return Center(child: Text('Hello ${state.user!.firstName}'));
          } else if (state.status == UserStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == UserStatus.initial) {
            Future.delayed(const Duration(milliseconds: 1000))
                .then((value) => BlocProvider.of<UserCubit>(context).getUser('steve'));
            Future.delayed(const Duration(milliseconds: 2000))
                .then((value) => BlocProvider.of<NavCubit>(context).showHome());
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        })));
  }

  Widget build2(BuildContext context) {
    // final u = User(firstName: 'Steve', lastName: 'Messing', userName: 'steve');
    BlocProvider.of<UserCubit>(context).getUser('steve');
    // Future.delayed(Duration(milliseconds: 1000))
    //     .then((value) => BlocProvider.of<NavCubit>(context).showHome());
    return const Center(child: Text('Login Page'));
  }
}
