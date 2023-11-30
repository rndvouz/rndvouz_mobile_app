import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.errorMessage, this.stacktrace, {super.key});

  final String errorMessage;
  final String stacktrace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Text('Error: $errorMessage\nStack trace: $stacktrace',
                style: Theme.of(context).textTheme.bodySmall!),
          )
        ],
      ),
    );
  }
}
