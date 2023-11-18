import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rndvouz/features/authentication/presentation/login_page.dart';
import 'package:rndvouz/features/common/presentation/global_snackbar.dart';
import 'package:rndvouz/features/setup_process/presentation/setup_top_bar.dart';
import 'package:rndvouz/features/user/data/user_db.dart';
import 'package:rndvouz/features/user/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';

final formSubmitProvider = StateProvider<bool>((ref) {
  return false;
});

class SetupLoginPageArguments {
  final bool isBusiness;

  SetupLoginPageArguments(this.isBusiness);
}

class SetupLoginPage extends ConsumerStatefulWidget {
  static const routeName = 'signup';
  const SetupLoginPage({super.key});

  @override
  ConsumerState<SetupLoginPage> createState() => _SetupLoginPageState();
}

class _SetupLoginPageState extends ConsumerState<SetupLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SetupLoginPageArguments args =
        ModalRoute.of(context)!.settings.arguments as SetupLoginPageArguments;
    final isBusiness = args.isBusiness;
    final AsyncValue<List<User>> asyncUsernames = ref.watch(usersProvider);
    final userDB = ref.watch(userDBProvider);
    return asyncUsernames.when(
      data: (listUsers) {
        return _build(
            context,
            userDB,
            listUsers,
            emailController,
            usernameController,
            passwordController,
            retypePasswordController,
            isBusiness,
            ref);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) {
        return const Center(child: Text('Something went wrong'));
      },
    );
  }

  Widget _build(
      BuildContext context,
      UserDB userDB,
      List<User> listUsers,
      TextEditingController emailController,
      TextEditingController usernameController,
      TextEditingController passwordController,
      TextEditingController retypePasswordController,
      bool isBusiness,
      WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SetupTopBar(state: isBusiness ? 'loginBusiness' : 'login'),
                Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 40),
                        _buildTextField(
                          "Email Address",
                          emailController,
                          listUsers: listUsers,
                          ref: ref,
                        ),
                        const SizedBox(height: 5),
                        _buildTextField(
                          "Username",
                          usernameController,
                          listUsers: listUsers,
                          ref: ref,
                        ),
                        const SizedBox(height: 5),
                        _buildTextField(
                          "Password",
                          passwordController,
                          isObscure: true,
                          ref: ref,
                        ),
                        const SizedBox(height: 5),
                        _buildTextField(
                          "Re-type Password",
                          retypePasswordController,
                          controller2: passwordController,
                          isObscure: true,
                          ref: ref,
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                ref.read(formSubmitProvider.notifier).state =
                                    true;
                                if (!formKey.currentState!.validate()) {
                                  GlobalSnackBar.show(
                                    'Please fill in all fields',
                                  );
                                  return;
                                }

                                final email = emailController.text;
                                final username = usernameController.text;
                                final password = passwordController.text;

                                try {
                                  final user = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);

                                  FirebaseAuth.instance.currentUser!
                                      .sendEmailVerification();

                                  final User newUser;

                                  newUser = User(
                                    id: user.user!.uid,
                                    username: username,
                                    email: email,
                                    displayName: username,
                                    isBusiness: isBusiness,
                                  );

                                  await userDB.setUser(newUser);
                                } on FirebaseAuthException {
                                  GlobalSnackBar.show(
                                      "Unknown error has occured, please try again later");
                                } catch (e) {
                                  GlobalSnackBar.show(
                                      "Unknown error has occured, please try again later");
                                }
                              },
                              child: const Text('Confirm'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
      TextEditingController? controller2,
      List<User>? listUsers,
      WidgetRef? ref}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: controller,
        obscureText: isObscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          final formSubmit = ref!.read(formSubmitProvider.notifier).state;
          if (controller.text.isEmpty && !formSubmit) {
            return null;
          }
          if (label == "Email Address") {
            if (User.isEmailValid(controller.text)) {
              // Checks if email is used
              if (listUsers!.any((user) => user.email == controller.text)) {
                return "Email already in use";
              }
              return null;
            } else {
              return "Please enter a valid email address";
            }
          }
          if (label == "Password") {
            if (controller.text.length < 6) {
              return "Password must be at least 6 characters";
            } else {
              return null;
            }
          }
          if (label == "Re-type Password") {
            if (controller.text != controller2!.text ||
                controller.text.isEmpty) {
              return "Password does not match";
            } else {
              return null;
            }
          }
          if (label == "Username") {
            if (controller.text.length < 3) {
              return "Username must be at least 3 characters";
            }
            if (listUsers!.any((user) => user.username == controller.text)) {
              return "Username already taken";
            }

            return null;
          }

          return null;
        },
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
