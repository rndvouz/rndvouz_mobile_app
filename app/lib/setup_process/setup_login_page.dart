import 'package:app/setup_process/setup_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app/data_model/user_db.dart';

import 'individual/individual_top_bar.dart';

class SetupLoginPage extends StatefulWidget {
  const SetupLoginPage({Key? key}) : super(key: key);

  @override
  SetupLoginPageState createState() => SetupLoginPageState();
}

class SetupLoginPageState extends State<SetupLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Wrap the entire content with SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IndividualSetupTopBar(state: 'login'),
                const SizedBox(height: 40),
                _buildTextField("Email Address", emailController),
                const SizedBox(height: 10),
                _buildTextField("Username", usernameController),
                const SizedBox(height: 10),
                _buildTextField("Password", passwordController,
                    isObscure: true),
                const SizedBox(height: 10),
                _buildTextField("Re-type Password", retypePasswordController,
                    isObscure: true),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Back'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final email = emailController.text;
                        final username = usernameController.text;
                        final password = passwordController.text;
                        final retypePassword = retypePasswordController.text;
                        final User newUser;

                        if (password == retypePassword) {
                          newUser = User(
                            username: username,
                            email: email,
                            password: password,
                          );

                          try {
                            userDB.userAdd(newUser);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SetupProfilePage(newUser: newUser)),
                            );
                          } catch (e) {
                            final exceptionMessage =
                                e.toString().replaceAll("Exception:", "");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(exceptionMessage),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Passwords do not match'),
                            ),
                          );
                        }
                      },
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isObscure = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
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
