import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    Map<String, dynamic> initialValueMap = {
      'firstname': 'Steve',
      'lastname': 'Messing',
      'email': 'steve@lacasadelpane.us',
    };

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [
        FormBuilder(
            key: _formKey,
            enabled: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: initialValueMap,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 6,
                      child: FormBuilderTextField(
                        name: 'firstname',
                        decoration: const InputDecoration(labelText: 'First Name: '),
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: FormBuilderTextField(
                        name: 'lastname',
                        decoration: const InputDecoration(labelText: 'Last Name: '),
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                FormBuilderTextField(
                  name: 'email',
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
  }
}
