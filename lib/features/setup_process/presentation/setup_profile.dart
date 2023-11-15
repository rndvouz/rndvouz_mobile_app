// import 'dart:typed_data';

// import 'package:rndvouz/features/setup_process/presentation/setup_style.dart';
// import 'package:rndvouz/features/common/presentation/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../user/domain/user_db.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'setup_top_bar.dart';
// import 'individual/individual_setup_swipe.dart';

// class SetupProfilePage extends ConsumerWidget {
//   final User newUser;

//   const SetupProfilePage({Key? key, required this.newUser}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final displayNameController =
//         TextEditingController(text: newUser.displayName);
//     final usernameController = TextEditingController(text: newUser.username);
//     final biographyController = TextEditingController();
//     Uint8List? selectedImage;
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SetupTopBar(
//               state: newUser.isBusiness ? 'profileBusiness' : 'profile',
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const SizedBox(height: 20), // Add spacing
//                       ImageSelectionButton(
//                         onImageSelected: (image) {
//                           selectedImage = image;
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       _buildTextField("Display Name", displayNameController),
//                       _buildTextField("Username", usernameController),
//                       _buildTextField('Biography', biographyController,
//                           width: 500, height: 120, lines: 3),
//                       const SizedBox(height: 40),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 0),
//                             ),
//                             child: const Text('Back'),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               newUser.displayName = displayNameController.text;
//                               newUser.username = usernameController.text;
//                               newUser.biography = biographyController.text;
//                               //newUser.imagePath =
//                               // Handle 'Next' button action
//                               try {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => newUser.isBusiness
//                                             ? SetupStyle(newUser: newUser)
//                                             : IndividualSetupSwipe(
//                                                 newUser: newUser)));
//                               } catch (e) {
//                                 final exceptionMessage =
//                                     e.toString().replaceAll("Exception:", "");
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(exceptionMessage),
//                                   ),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 0),
//                             ),
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
//       {bool isObscure = false,
//       double width = 500,
//       double height = 60,
//       int lines = 1}) {
//     return Container(
//       width: width, // Set the width
//       height: height, // Set the height
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: TextField(
//         controller: controller,
//         obscureText: isObscure,
//         maxLines: lines,
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

// class ImageSelectionButton extends StatefulWidget {
//   final Function(Uint8List?) onImageSelected;

//   const ImageSelectionButton({Key? key, required this.onImageSelected})
//       : super(key: key);

//   @override
//   _ImageSelectionButtonState createState() => _ImageSelectionButtonState();
// }

// class _ImageSelectionButtonState extends State<ImageSelectionButton> {
//   Uint8List? _image;

//   void selectImage(ImageSource source) async {
//     Uint8List? img = await pickAndCropImage(source);
//     if (img != null) {
//       setState(() {
//         _image = img;
//       });
//       widget.onImageSelected(_image);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         ImageOptionsUtil.showImageSourceOptions(
//             context, (imageSource) => selectImage(imageSource));
//       },
//       child: Container(
//         width: 250,
//         height: 250,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.grey[300],
//         ),
//         child: _image != null
//             ? ClipOval(
//                 child: Image.memory(
//                   _image!,
//                   fit: BoxFit.cover,
//                 ),
//               )
//             : Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.add_a_photo_outlined,
//                       size: 40,
//                       color: Colors.grey[600],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Add Photo',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
