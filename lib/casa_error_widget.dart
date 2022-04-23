import 'package:flutter/material.dart';

class CasaErrorWidget extends StatelessWidget {
  final Exception exception;

  const CasaErrorWidget({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something was wrong ${exception.toString()}',
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
