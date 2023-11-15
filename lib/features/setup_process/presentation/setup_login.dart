// import 'package:rndvouz/features/setup_process/presentation/setup_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:rndvouz/features/user/domain/user_db.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rndvouz/features/user/data/user_providers.dart';

// import 'setup_top_bar.dart';

// class SetupLoginPage extends ConsumerWidget {
//   final bool isBusiness;

//   const SetupLoginPage({Key? key, required this.isBusiness}) : super(key: key);
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final UserDB userDB = ref.watch(userDBProvider);
//     TextEditingController emailController = TextEditingController();
//     TextEditingController usernameController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     TextEditingController retypePasswordController = TextEditingController();

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SetupTopBar(state: isBusiness ? 'loginBusiness' : 'login'),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   // Wrap the entire content with SingleChildScrollView
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const SizedBox(height: 40),
//                       _buildTextField("Email Address", emailController),
//                       const SizedBox(height: 10),
//                       _buildTextField("Username", usernameController),
//                       const SizedBox(height: 10),
//                       _buildTextField("Password", passwordController,
//                           isObscure: true),
//                       const SizedBox(height: 10),
//                       _buildTextField(
//                           "Re-type Password", retypePasswordController,
//                           isObscure: true),
//                       const SizedBox(height: 40),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text('Back'),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               final email = emailController.text;
//                               final username = usernameController.text;
//                               final password = passwordController.text;
//                               final retypePassword =
//                                   retypePasswordController.text;
//                               final User newUser;

//                               if (password == retypePassword) {
//                                 newUser = User(
//                                   username: username,
//                                   email: email,
//                                   password: password,
//                                   isBusiness: isBusiness,
//                                 );

//                                 try {
//                                   userDB.validateUser(newUser);
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             SetupProfilePage(newUser: newUser)),
//                                   );
//                                 } catch (e) {
//                                   final exceptionMessage =
//                                       e.toString().replaceAll("Exception:", "");
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(exceptionMessage),
//                                     ),
//                                   );
//                                 }
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text('Passwords do not match'),
//                                   ),
//                                 );
//                               }
//                             },
//                             child: const Text('Next'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, TextEditingController controller,
//       {bool isObscure = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         obscureText: isObscure,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
