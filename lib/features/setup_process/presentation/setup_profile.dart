import 'dart:convert';
import 'dart:typed_data';

import 'package:rndvouz/features/common/data/global_navigator_key.dart';
import 'package:rndvouz/features/common/presentation/global_snackbar.dart';
import 'package:rndvouz/features/common/presentation/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import '../../user/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'setup_top_bar.dart';

class SetupProfilePage extends ConsumerWidget {
  const SetupProfilePage({super.key});

  static const String routeName = '/setupProfile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserAsyncValue = ref.watch(currentUserProvider);

    return currentUserAsyncValue.when(
        data: (user) {
          return _build(context, ref, user);
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stacktrace) => const Text("Something went wrong"));
  }

  Widget _build(BuildContext context, WidgetRef ref, User newUser) {
    final displayNameController =
        TextEditingController(text: newUser.displayName);
    final biographyController = TextEditingController(text: newUser.biography);
    Uint8List? selectedImage = base64Decode(newUser.imagePath ?? "");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SetupTopBar(
              state: newUser.isBusiness ? 'profileBusiness' : 'profile',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ImageSelectionButton(
                      onImageSelected: (image) {
                        selectedImage = image;
                      },
                    ),
                    Column(
                      children: [
                        _buildTextField("Display Name", displayNameController),
                        _buildTextField('Biography', biographyController,
                            width: 500, height: 120, lines: 3),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                          ),
                          child: const Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (selectedImage == null) {
                              GlobalSnackBar.show("Please select an image");
                              return;
                            }
                            final imageData =
                                base64Encode(selectedImage!.toList());
                            final updatedUser = newUser.copyWith(
                                displayName: displayNameController.text,
                                biography: biographyController.text,
                                imagePath: imageData,
                                setupStep: "setupSwipe");

                            final userDB = ref.watch(userDBProvider);
                            await userDB.updateUser(updatedUser);
                            GlobalNavigatorKey.navigatorKey.currentState!
                                .pushNamed("/setupSwipe");
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
          ],
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
      margin: const EdgeInsets.symmetric(vertical: 4),
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

class ImageSelectionButton extends StatefulWidget {
  final Function(Uint8List?) onImageSelected;

  const ImageSelectionButton({super.key, required this.onImageSelected});

  @override
  State<ImageSelectionButton> createState() => _ImageSelectionButtonState();
}

class _ImageSelectionButtonState extends State<ImageSelectionButton> {
  Uint8List? _image;

  void selectImage(ImageSource source) async {
    Uint8List? img = await pickAndCropImage(source);
    if (img != null) {
      setState(() {
        _image = img;
      });
      widget.onImageSelected(_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ImageOptionsUtil.showImageSourceOptions(
            context, (imageSource) => selectImage(imageSource));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: _image != null
            ? ClipOval(
                child: Image.memory(
                  _image!,
                  fit: BoxFit.cover,
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      size: 40,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(height: 8),
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
