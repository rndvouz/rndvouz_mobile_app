import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:rndvouz/features/common/data/global_navigator_key.dart";
import "package:rndvouz/features/user/data/user_providers.dart";
import "package:rndvouz/features/user/domain/user.dart";
import "package:rndvouz/repositories/firestore/firestore_providers.dart";

class GetStartedPage extends ConsumerWidget {
  const GetStartedPage({super.key});
  static const String routeName = "/setup";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.read(fetchCurrentUserProvider.future),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _build(context, snapshot.data, ref);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _build(BuildContext context, User? user, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              user!.setupStep == "setupBegin"
                  ? const Text("Get Started with you Set Up!")
                  : const Text("Continue your Set Up!"),
              ElevatedButton(
                  onPressed: () async {
                    final user = await ref.read(currentUserProvider.future);
                    final routeName = "/${user.setupStep}";
                    if (routeName == "/setupBegin") {
                      final userDB = ref.read(userDBProvider);
                      userDB.setUser(user.copyWith(setupStep: "setupProfile"));
                      GlobalNavigatorKey.navigatorKey.currentState
                          ?.pushNamed("/setupProfile");
                    }
                    GlobalNavigatorKey.navigatorKey.currentState
                        ?.pushNamed(routeName);
                  },
                  child: user.setupStep == "setupBegin"
                      ? const Text("Begin Setup")
                      : const Text("Continue Setup")),
              ElevatedButton(
                  onPressed: () {
                    final auth = ref.read(firebaseAuthProvider);
                    auth.signOut();
                  },
                  child: const Text("Sign Out")),
            ],
          ),
        ),
      ),
    );
  }
}
