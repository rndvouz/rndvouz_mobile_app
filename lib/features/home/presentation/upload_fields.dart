import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/colors.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

import '../data/upload_item_providers.dart';

class UploadFields extends ConsumerWidget {
  const UploadFields(Uint8List? selectedImage, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final merchNameController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final negotiationRangeController = TextEditingController();
    final desiredTradeController = TextEditingController();

    final bustController = TextEditingController();
    final waistController = TextEditingController();
    final hipsController = TextEditingController();
    final inseamController = TextEditingController();
    final sleeveLengthController = TextEditingController();
    final lengthController = TextEditingController();

    final theState = ref.watch(sellingMethodStateProvider);

    if (theState == SellingMethod.selling) {
      return _buildSellingFields();
    } else if (theState == SellingMethod.negotiate) {
      return _buildNegotiateFields();
    } else {
      return _buildTradeFields();
    }
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

  Widget _buildSellingFields() {
    return Text("selling");
  }

  Widget _buildNegotiateFields() {
    return Text("negotiate");
  }

  Widget _buildTradeFields() {
    return Text("trade");
  }
}
