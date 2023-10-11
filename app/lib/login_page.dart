import 'package:flutter/material.dart';
import 'package:app/data_model/user_db.dart';
import 'home_screen/home_bottom_nav_bar.dart';
import 'package:app/onboarding_process/user_type_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final UserDB userDB = UserDB();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Text(
                'RNDVOUZ',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'RobotoMono',
                  shadows: [
                    Shadow(
                      color: Colors.grey,
                      offset: Offset(5, 5),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;
                User? user;
                try {
                  final user = userDB.getUser(username);
                  if (user != null && user.password == password) {
                    setState(() {
                      errorMessage = "";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeBottomNavBar()));
                  } else {
                    setState(() {
                      errorMessage = "Invalid password";
                    });
                  }
                } catch (e) {
                  setState(() {
                    errorMessage = "User not found";
                  });
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle "Forgot Password" action here
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserTypePage()));
                    // Handle "Sign Up" action here
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            // Display error message
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
