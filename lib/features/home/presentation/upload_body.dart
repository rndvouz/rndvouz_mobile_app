import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/colors.dart';

class UploadBody extends ConsumerWidget {
  const UploadBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 30,
        width: 100,
        color: primaryGreen,
      ),
    );
  }
}
