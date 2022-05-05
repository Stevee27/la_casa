import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/auth/bloc/auth_bloc.dart';

class AuthLayout extends StatelessWidget {
  final bool failure;

  AuthLayout({Key? key, this.failure = false}) : super(key: key);

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset('assets/images/curbview.jpg'),
          const Text('Login Page', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextField(
            controller: myController,
            decoration: InputDecoration(border: UnderlineInputBorder(), hintText: "Enter your username"),
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(border: UnderlineInputBorder(), hintText: "Password"),
          ),
          if (failure)
            Text(
              'login failed',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
            ),
          TextButton(
            onPressed: () {
              var username = myController.text;
              BlocProvider.of<AuthCubit>(context).authenticate(username);
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

  void _user() {
    print(myController.text);
  }
}
