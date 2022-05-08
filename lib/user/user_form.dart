import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'bloc/user_bloc.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state.status == UserStatus.success) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            FormBuilder(
                key: _formKey,
                enabled: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 6,
                          child: FormBuilderTextField(
                            name: 'firstname',
                            initialValue: state.user!.firstName,
                            decoration: const InputDecoration(labelText: 'First Name: '),
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 6,
                          child: FormBuilderTextField(
                            name: 'lastname',
                            initialValue: state.user!.lastName,
                            decoration: const InputDecoration(labelText: 'Last Name: '),
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                      ],
                    ),
                    FormBuilderTextField(
                      name: 'email',
                      initialValue: state.user!.email,
                      decoration: const InputDecoration(labelText: 'Email: '),
                      validator: FormBuilderValidators.email(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Spacer(flex: 24),
                          ElevatedButton(child: Text('Cancel'), onPressed: () {}),
                          const Spacer(),
                          ElevatedButton(child: Text('Submit'), onPressed: () {}),
                        ],
                      ),
                    ),
                  ],
                ))
          ]),
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
