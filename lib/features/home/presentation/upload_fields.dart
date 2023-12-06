import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/colors.dart';
import 'package:rndvouz/features/home/presentation/home_search.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_garment.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_style.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';

import '../data/upload_item_providers.dart';

class UploadFields extends ConsumerStatefulWidget {
  @override
  ConsumerState<UploadFields> createState() => _UploadFieldsState();
}

class _UploadFieldsState extends ConsumerState<UploadFields> {
  final merchNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final lowerRangeController = TextEditingController();
  final upperRangeController = TextEditingController();
  final desiredTradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final theState = ref.watch(sellingMethodStateProvider);

    final selectedGarment = ref.watch(selectedGarmentProvider);

    final primaryStyle = ref.watch(primaryStyleProvider);
    final secondaryStyle = ref.watch(secondaryStyleProvider);

    final merchDB = ref.watch(merchandiseDBProvider);

    final currentUser = ref.watch(currentUserProvider);

    Widget methodSection;

    if (theState == SellingMethod.selling) {
      methodSection = _buildSellingFields(
          context: context, priceController: priceController);
    } else if (theState == SellingMethod.negotiate) {
      methodSection = _buildNegotiateFields(
        context: context,
        lowerRangeController: lowerRangeController,
        upperRangeController: upperRangeController,
        desiredTradeController: desiredTradeController,
      );
    } else {
      methodSection = _buildTradeFields(
        context: context,
        desiredTradeController: desiredTradeController,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: screenWidth * 0.05,
        ),
        _buildTextField(context, "Merchandise Name", merchNameController),
        _buildTextField(context, "Description", descriptionController),
        methodSection,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButton<Garment>(
              alignment: AlignmentDirectional.topStart,
              value: selectedGarment,
              items: [
                for (Garment garment in Garment.values)
                  DropdownMenuItem(
                    value: garment,
                    child: Text(garment.name.capitalize()),
                  ),
              ],
              onChanged: (value) {
                ref.read(selectedGarmentProvider.notifier).state = value!;
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: DropdownButton<PrimaryStyle>(
                alignment: AlignmentDirectional.topStart,
                value: primaryStyle,
                items: [
                  for (PrimaryStyle style in PrimaryStyle.values)
                    DropdownMenuItem(
                      value: style,
                      child: Text(style.name.capitalize()),
                    ),
                ],
                onChanged: (value) {
                  ref.read(primaryStyleProvider.notifier).state = value!;
                },
              ),
            ),
            SizedBox(
              width: screenWidth * 0.1,
            ),
            Expanded(
              child: DropdownButton<SecondaryStyle>(
                alignment: AlignmentDirectional.topStart,
                value: secondaryStyle,
                items: [
                  for (SecondaryStyle style in SecondaryStyle.values)
                    DropdownMenuItem(
                      value: style,
                      child: Text(style.name.capitalize()),
                    ),
                ],
                onChanged: (value) {
                  ref.read(secondaryStyleProvider.notifier).state = value!;
                },
              ),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              final imageData = ref.watch(imagePathProvider);
              final newID =
                  FirebaseFirestore.instance.collection("merchandise").doc().id;
              Merchandise newMerch = Merchandise(
                id: newID,
                ownerUsername: currentUser.value!.username,
                purpose: Purpose.browse,
                primaryStyle: primaryStyle,
                secondaryStyle: secondaryStyle,
                garment: selectedGarment,
                merchName: merchNameController.text,
                sellingMethod: theState!,
                price: double.parse(priceController.text),
                likes: 0,
                state: Availability.selling,
                imagePath: imageData,
              );
              merchDB.setMerchandise(newMerch);
            },
            child: Text("Submit")),
      ],
    );
  }

  Widget _buildTextField(
      BuildContext context, String label, TextEditingController controller,
      {bool isObscure = false, int lines = 1}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          constraints:
              BoxConstraints(maxHeight: screenHeight, maxWidth: screenWidth),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            keyboardType: label == "Description" || label == "Desired Trade"
                ? TextInputType.multiline
                : null,
            controller: controller,
            obscureText: isObscure,
            maxLines: label == "Description" || label == "Desired Trade"
                ? null
                : lines,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
      ],
    );
  }

  Widget _buildNumberField(
      BuildContext context, String label, TextEditingController controller,
      {bool isObscure = false, int lines = 1}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          constraints:
              BoxConstraints(maxHeight: screenHeight, maxWidth: screenWidth),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
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
          height: screenHeight * 0.01,
        ),
      ],
    );
  }

  Widget _buildSellingFields(
      {required BuildContext context,
      required TextEditingController priceController}) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildNumberField(context, "Price", priceController),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth * 0.5,
        ),
      ],
    );
  }

  Widget _buildNegotiateFields(
      {required BuildContext context,
      required TextEditingController lowerRangeController,
      required TextEditingController upperRangeController,
      required TextEditingController desiredTradeController}) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildNumberField(
                      context, "Lower Range", lowerRangeController),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Expanded(
              child: Column(
                children: [
                  _buildNumberField(
                      context, "Upper Range", upperRangeController),
                ],
              ),
            ),
          ],
        ),
        _buildTextField(context, "Desired Trade", desiredTradeController),
      ],
    );
  }

  Widget _buildTradeFields(
      {required BuildContext context,
      required TextEditingController desiredTradeController}) {
    final desiredTradeController = TextEditingController();
    return _buildTextField(context, "Desired Trade", desiredTradeController);
  }
}
