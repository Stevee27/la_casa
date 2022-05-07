import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FormBuilder(
          child: Column(
        children: [
          FormBuilderFilterChip(
            name: 'filter_chip',
            decoration: const InputDecoration(
              labelText: 'Select many options',
            ),
            // ignore: prefer_const_literals_to_create_immutables
            options: [
              const FormBuilderFieldOption(value: 'Test', child: Text('Test')),
              const FormBuilderFieldOption(value: 'Test 1', child: Text('Test 1')),
              const FormBuilderFieldOption(value: 'Test 2', child: Text('Test 2')),
              const FormBuilderFieldOption(value: 'Test 3', child: Text('Test 3')),
              const FormBuilderFieldOption(value: 'Test 4', child: Text('Test 4')),
            ],
          ),
        ],
      ))
    ]);
  }
}
