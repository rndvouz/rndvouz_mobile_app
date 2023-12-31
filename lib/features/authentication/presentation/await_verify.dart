import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/global_navigator_key.dart';
import 'package:rndvouz/features/setup_process/presentation/get_started.dart';
import 'package:rndvouz/repositories/firestore/firestore_providers.dart';

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
        GlobalNavigatorKey.navigatorKey.currentState
            ?.pushNamed(GetStartedPage.routeName);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Waiting for email verification :)",
                style: Theme.of(context).textTheme.titleLarge),
            ElevatedButton(
              onPressed: () {
                ref.read(firebaseAuthProvider).signOut();
              },
              child: const Text("Go Back to Log In"),
            ),
          ],
        ),
      ),
    );
  }
}
