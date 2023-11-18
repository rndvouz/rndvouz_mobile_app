import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rndvouz/repositories/firestore/firestore_service.dart';

part 'firestore_providers.g.dart';

/// Provides access to a [FirebaseAuth.instance].
@Riverpod()
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

/// Provides access to [FirebaseAuth.authStateChanges].
@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
FirestoreService firestoreService(FirestoreServiceRef ref) {
  return FirestoreService(ref);
}

// Old way:
// final firebaseAuthProvider =
//     Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
/// Provides access to [FirebaseAuth.authStateChanges].
// final authStateChangesProvider = StreamProvider<User?>(
//     (ref) => ref.watch(firebaseAuthProvider).authStateChanges());