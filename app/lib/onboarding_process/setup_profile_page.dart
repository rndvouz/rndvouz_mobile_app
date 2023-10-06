import 'package:app/onboarding_process/onboarding_swipe.dart';
import 'package:app/onboarding_process/setup_login_page.dart';
import 'package:flutter/material.dart';
import 'package:app/onboarding_process/sign_up_top_bar.dart';
class SetupProfilePage extends StatefulWidget {
  const SetupProfilePage({Key? key}) : super(key: key);

  @override
  SetupProfilePageState createState() => SetupProfilePageState();
}

class SetupProfilePageState extends State<SetupProfilePage> {
  TextEditingController displayNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController biographyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignUpTopBar(state: 'profile'),
                const SizedBox(height: 20), // Add spacing
                ProfilePictureUploadButton(onPressed: () {}),
                const SizedBox(height: 20),
                _buildTextField("Display Name", displayNameController),
                _buildTextField("Username", usernameController),
                _buildTextField('Biography', biographyController,
                    width: 500, height: 120, lines: 3),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetupLoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                      child: const Text('Back'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoardingSwipe()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                      ),
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
      {bool isObscure = false,
      double width = 500,
      double height = 60,
      int lines = 1}) {
    return Container(
      width: width, // Set the width
      height: height, // Set the height
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
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

class ProfilePictureUploadButton extends StatelessWidget {
  final Function() onPressed;

  const ProfilePictureUploadButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_a_photo_outlined,
                size: 40,
                color: Colors.grey[600],
              ),
              const SizedBox(height: 8), // Add spacing between Icon and Text
              Text(
                'Add Photo',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
