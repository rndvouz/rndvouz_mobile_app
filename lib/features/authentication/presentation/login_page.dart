import 'package:flutter/material.dart';
import 'package:rndvouz/features/user/domain/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/home/presentation/home_bottom_nav_bar.dart';
import 'package:rndvouz/features/setup_process/presentation/user_type.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';

final errorMessageProvider =
    StateNotifierProvider<ErrorMessageNotifier, String?>((ref) {
  return ErrorMessageNotifier();
});

class ErrorMessageNotifier extends StateNotifier<String?> {
  ErrorMessageNotifier() : super(null);

  void setError(String message) {
    state = message;
  }

  void clearError() {
    state = null;
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserDB userDB = ref.watch(userDBProvider);
    final String currentUser = ref.watch(currentUserProvider);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    final errorMessage = ref.watch(errorMessageProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: passwordController,
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
                  final username = usernameController.text;
                  final password = passwordController.text;

                  try {
                    final user = userDB.getUser(username);

                    if (user.password == password) {
                      ref.read(errorMessageProvider.notifier).clearError();
                      ref.read(currentUserProvider.notifier).state = username;

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeBottomNavBar(),
                        ),
                      );
                    } else {
                      ref
                          .read(errorMessageProvider.notifier)
                          .setError('Invalid password');
                    }
                  } catch (e) {
                    ref
                        .read(errorMessageProvider.notifier)
                        .setError('User not found');
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
                          builder: (context) => const UserTypePage(),
                        ),
                      );
                      // Handle "Sign Up" action here
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              if (errorMessage != null)
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
