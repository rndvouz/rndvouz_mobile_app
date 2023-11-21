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
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final negotiationController = TextEditingController();

    final theState = ref.watch(sellingMethodStateProvider);

    return Column(children: [
      theState == SellingMethod.selling
          ? _buildTextField(context, "Price", priceController)
          : Container(),
      theState == SellingMethod.negotiate
          ? _buildTextField(context, "Price", priceController)
          : Container(),
      theState == SellingMethod.negotiate
          ? _buildTextField(context, "Negotiation Range", negotiationController)
          : Container(),
      _buildTextField(context, "Title", titleController),
      _buildTextField(context, "Description", descriptionController),
      const SizedBox(height: 40),
      ElevatedButton(
        onPressed: () {},
        child: Text("Add"),
      ),
    ]);
  }

  Widget _buildTextField(
      BuildContext context, String label, TextEditingController controller,
      {bool isObscure = false, int lines = 1}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorCream0,
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: screenWidth * 0.9, // Set the width
          height: screenHeight * 0.05, // Set the height
          // padding: const EdgeInsets.symmetric(vertical: 8),
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
        ),
        SizedBox(
          height: screenHeight * 0.02,
        )
      ],
    );
  }
}
