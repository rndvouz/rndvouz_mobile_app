import 'dart:typed_data';

import 'package:app/setup_process/setup_style.dart';
import 'package:app/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data_model/user_db.dart';

import 'setup_top_bar.dart';
import 'individual_setup_swipe.dart';

class SetupProfilePage extends StatefulWidget {
  final User newUser;

  const SetupProfilePage({Key? key, required this.newUser}) : super(key: key);

  @override
  SetupProfilePageState createState() => SetupProfilePageState();
}

class SetupProfilePageState extends State<SetupProfilePage> {
  late TextEditingController displayNameController;
  late TextEditingController usernameController;
  late User user;
  TextEditingController biographyController = TextEditingController();
  Uint8List? selectedImage;

  SetupProfilePageState();

  @override
  void initState() {
    super.initState();
    displayNameController =
        TextEditingController(text: widget.newUser.displayName);
    usernameController = TextEditingController(text: widget.newUser.username);
    user = widget.newUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SetupTopBar(
              state: widget.newUser.isBusiness ? 'profileBusiness' : 'profile',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20), // Add spacing
                      ImageSelectionButton(
                        onImageSelected: (image) {
                          setState(() {
                            selectedImage = image;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildTextField("Display Name", displayNameController),
                      _buildTextField("Username", usernameController),
                      _buildTextField('Biography', biographyController,
                          width: 500, height: 120, lines: 3),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle 'Next' button action
                              final updatedDisplayName =
                                  displayNameController.text;
                              final updatedBiography = biographyController.text;
                              final updatedUsername = usernameController.text;
                              try {
                                userDB.updateUserProfileFields(
                                  user,
                                  displayName: updatedDisplayName,
                                  newUsername: updatedUsername,
                                  biography: updatedBiography,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            widget.newUser.isBusiness
                                                ? SetupStyle(
                                                    newUser: widget.newUser)
                                                : IndividualSetupSwipe(
                                                    newUser: widget.newUser)));
                              } catch (e) {
                                final exceptionMessage =
                                    e.toString().replaceAll("Exception:", "");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(exceptionMessage),
                                  ),
                                );
                              }
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

  const ImageSelectionButton({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  _ImageSelectionButtonState createState() => _ImageSelectionButtonState();
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
        width: 250,
        height: 250,
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
