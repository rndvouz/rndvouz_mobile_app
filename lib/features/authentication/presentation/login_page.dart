import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rndvouz/features/authentication/presentation/user_type.dart';
import 'package:rndvouz/features/common/data/global_navigator_key.dart';
import 'package:rndvouz/features/user/data/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/home/presentation/home_bottom_nav_bar.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:rndvouz/repositories/firestore/firestore_providers.dart';

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
    final FirebaseAuth auth = ref.watch(firebaseAuthProvider);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    final errorMessage = ref.watch(errorMessageProvider);

    auth.authStateChanges().listen((User? user) async {
      await user?.reload();
      if (user != null) {
        if (!user.emailVerified) {
          GlobalNavigatorKey.navigatorKey.currentState!.pushNamed("/verify");
        } else {
          GlobalNavigatorKey.navigatorKey.currentState!.pushNamed("/home");
        }
        print(user);
      }
    });

    return Scaffold(
      body: Center(
        child: AuthFlowBuilder<EmailAuthController>(
            auth: FirebaseAuth.instance,
            action: AuthAction.signIn,
            listener: (oldState, newState, ctrl) async {
              if (newState is SignedIn) {
                ref.read(currentUserIdProvider.notifier).state =
                    newState.user!.uid;
                ref.read(errorMessageProvider.notifier).clearError();
                Navigator.of(context).pushReplacementNamed('/login');
              } else if (newState is AuthFailed) {
                if (usernameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ref
                      .read(errorMessageProvider.notifier)
                      .setError("Please enter a username and password");
                } else {
                  ref
                      .read(errorMessageProvider.notifier)
                      .setError("Invalid email or password");
                }
              }
            },
            builder: (context, state, ctrl, child) {
              if (state is AwaitingEmailAndPassword || state is AuthFailed) {
                return Column(
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
                                // hintText: 'Username',
                                // hintStyle: TextStyle(color: Colors.grey),
                                labelText: 'Username',
                                floatingLabelStyle: TextStyle(fontSize: 20),
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            floatingLabelStyle: TextStyle(fontSize: 20),
                            // hintText: 'Password',
                            // hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (errorMessage != null)
                      Text(
                        errorMessage,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final email = await userDB
                            .getEmailFromUsername(usernameController.text);
                        ctrl.setEmailAndPassword(
                            email, passwordController.text);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
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
                  ],
                );
              } else if (state is SigningIn) {
                print("signing in");
                return const Center(child: CircularProgressIndicator());
              } else if (state is AuthFailed) {
                print("auth failed");
                return ErrorText(exception: state.exception);
              } else {
                return const Text("Something went wrong");
              }
            }),
      ),
    );
  }
}
