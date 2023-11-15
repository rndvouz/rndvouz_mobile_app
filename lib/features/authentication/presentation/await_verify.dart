import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/global_navigator_key.dart';

class AwaitVerifyPage extends ConsumerStatefulWidget {
  const AwaitVerifyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AwaitVerifyPage> createState() => _AwaitVerifyPageState();
}

class _AwaitVerifyPageState extends ConsumerState<AwaitVerifyPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        GlobalNavigatorKey.navigatorKey.currentState?.pushNamed("/home");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Implement your amazing waiting screen here
    return Scaffold(
      body: Center(
        child: Text("Waiting for email verification"),
      ),
    );
  }
}
