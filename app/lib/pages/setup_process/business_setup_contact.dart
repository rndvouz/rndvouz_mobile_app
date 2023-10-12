import 'package:app/pages/setup_process/business_setup_verify.dart';
import 'package:app/pages/setup_process/setup_top_bar.dart';
import 'package:flutter/material.dart';

import '../../data_models/user_db.dart';

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
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                SizedBox(height: 25),
                Text(
                  'Contact Person 1:',
                  textAlign: TextAlign.left,
                ),
                _buildTextField('Name'),
                _buildTextField('Email Address'),
                _buildTextField('Phone Number'),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add Another Contact'),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(140.0, 48.0)),
                          child: Text('Back'),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusinessSetupVerify(
                                        newUser: widget.newUser)));
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(140.0, 48.0)),
                          child: Text('Next'),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _buildTextField(String label,
      {bool isObscure = false,
      double width = 500,
      double height = 60,
      int lines = 1}) {
    return Container(
      width: width, // Set the width
      height: height, // Set the height
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: isObscure,
        maxLines: lines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
