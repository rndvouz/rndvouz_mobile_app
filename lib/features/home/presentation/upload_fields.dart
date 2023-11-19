import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/colors.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

import 'dart:developer' as developer;

import '../data/upload_item_providers.dart';

class UploadFields extends ConsumerWidget {
  const UploadFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final negotiationController = TextEditingController();

    final theState = ref.watch(sellingMethodStateProvider);

    return Column(children: [
      theState == SellingMethod.selling
          ? _buildTextField("Price", priceController)
          : Container(),
      theState == SellingMethod.negotiate
          ? _buildTextField("Price", priceController)
          : Container(),
      theState == SellingMethod.negotiate
          ? _buildTextField("Negotiation Range", negotiationController)
          : Container(),
      _buildTextField("Title", titleController),
      _buildTextField("Description", descriptionController),
      const SizedBox(height: 40),
      ElevatedButton(
        onPressed: () {},
        child: Text("Add"),
      ),
    ]);
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
