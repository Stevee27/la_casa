import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/auth/bloc/auth_bloc.dart';

class AuthLayout extends StatefulWidget {
  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text('Login Page', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const TextField(
            decoration: InputDecoration(border: UnderlineInputBorder(), hintText: "Enter your username"),
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(border: UnderlineInputBorder(), hintText: "Password"),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).authenticate('steve');
            },
            child: Text('Login'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Not registered? Register here'),
          ),
        ]),
      ),
    );
  }
}
