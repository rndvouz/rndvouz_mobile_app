import 'dart:typed_data';

import 'package:rndvouz/features/home/presentation/upload_fields.dart';
import 'package:rndvouz/features/home/presentation/upload_menu.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_db.dart';
import 'package:rndvouz/features/setup_process/presentation/setup_style.dart';
import 'package:rndvouz/features/common/presentation/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/upload_item_providers.dart';

class HomeUploadItem extends ConsumerWidget {
  const HomeUploadItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Uint8List? selectedImage;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                          selectedImage = image;
                        },
                      ),
                      UploadMenu(),
                      const SizedBox(height: 20),
                      UploadFields(),
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
          shape: BoxShape.rectangle,
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
