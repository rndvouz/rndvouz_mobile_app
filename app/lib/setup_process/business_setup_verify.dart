import 'package:app/setup_process/setup_top_bar.dart';
import 'package:flutter/material.dart';

import '../data_model/user_db.dart';

class BusinessSetupVerify extends StatefulWidget {
  final User newUser;

  const BusinessSetupVerify({Key? key, required this.newUser})
      : super(key: key);

  @override
  _BusinessSetupVerifyState createState() => _BusinessSetupVerifyState();
}

class _BusinessSetupVerifyState extends State<BusinessSetupVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [SetupTopBar(state: 'verifyBusiness')],
      )),
    );
  }
}
