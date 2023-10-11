import 'package:app/setup_process/setup_top_bar.dart';
import 'package:flutter/material.dart';

import '../data_model/user_db.dart';

class BusinessSetupContact extends StatefulWidget {
  final User newUser;

  const BusinessSetupContact({Key? key, required this.newUser})
      : super(key: key);

  @override
  _BusinessSetupContactState createState() => _BusinessSetupContactState();
}

class _BusinessSetupContactState extends State<BusinessSetupContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SetupTopBar(state: 'contactBusiness'),
          Row(
            children: [
              Text('Contact Person 1'),
              // _buildTextField('Name'),
              // _buildTextField('Email Address'),
              // _buildTextField('Phone Number'),
            ],
          )
        ],
      )),
    );
  }

  // Widget _buildTextField(String label,
  //     {bool isObscure = false,
  //     double width = 500,
  //     double height = 60,
  //     int lines = 1}) {
  //   return Container(
  //     width: width, // Set the width
  //     height: height, // Set the height
  //     padding: const EdgeInsets.symmetric(vertical: 8),
  //     child: TextField(
  //       obscureText: isObscure,
  //       maxLines: lines,
  //       decoration: InputDecoration(
  //         labelText: label,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
