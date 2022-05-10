import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';
import '../nav/nav_bar.dart';
import '../nav/bloc/nav_cubit.dart';
import 'bloc/user_bloc.dart';
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
          automaticallyImplyLeading: false,
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
            return Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      child: const Text('logout', style: TextStyle(fontStyle: FontStyle.italic)),
                      onPressed: () => _logout(context),
                    )
                  ],
                ),
                Text('User Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                UserForm(),
                Spacer(flex: 10),
              ],
            );
            // return Center(child: Text('Hello ${state.user!.firstName}'));
          } else {
            return Container();
          }
        })),
        bottomNavigationBar: NavBar(3));
  }

  _logout(context) {
    BlocProvider.of<NavCubit>(context).showAuth();
    BlocProvider.of<AuthCubit>(context).logout(context);
  }
}
