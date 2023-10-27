import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';

pickAndCropImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  final ImageCropper imageCropper = ImageCropper();

  XFile? file = await imagePicker.pickImage(source: source);

  if (file == null) {
    return null;
  }

  var croppedFile = await imageCropper.cropImage(
    sourcePath: file.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  );

  if (croppedFile == null) {
    return null;
  }
  return await croppedFile.readAsBytes();
}

class ImageOptionsUtil {
  static void showImageSourceOptions(
      BuildContext context, Function(ImageSource) onSelectImageSource) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                onSelectImageSource(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () {
                Navigator.pop(context);
                onSelectImageSource(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }
}
