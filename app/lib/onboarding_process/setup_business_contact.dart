import 'package:app/onboarding_process/sign_up_top_bar.dart';
import 'package:flutter/material.dart';

class SetupBusinessContact extends StatefulWidget {
  const SetupBusinessContact({super.key});

  @override
  _SetupBusinessContact createState() => _SetupBusinessContact();
}

class _SetupBusinessContact extends State<SetupBusinessContact> {
  final String step = 'contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [SignUpTopBar(state: 'contact')],
      )),
    );
  }
}
