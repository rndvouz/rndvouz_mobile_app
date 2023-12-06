import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/repositories/firestore/firestore_providers.dart';
import 'package:rndvouz/repositories/firestore/firestore_path.dart';
import 'package:rndvouz/repositories/firestore/firestore_service.dart';
import '../domain/user.dart';

class UserDB {
  UserDB(this.ref) {
    _service = ref.read(firestoreServiceProvider);
  }

  final ProviderRef<UserDB> ref;

  late FirestoreService _service;

  Stream<List<User>> watchUsers() => _service.watchCollection(
      path: FirestorePath.users(),
      builder: (data, documentId) => User.fromJson(data!));

  Stream<User> watchUser(String userId) => _service.watchDocument(
      path: FirestorePath.user(userId),
      builder: (data, documentId) => User.fromJson(data!));

  Future<List<User>> fetchUsers() => _service.fetchCollection(
      path: FirestorePath.users(),
      builder: (data, documentId) => User.fromJson(data!));

  Future<User> fetchUser(String userId) => _service.fetchDocument(
      path: FirestorePath.user(userId),
      builder: (data, documentId) => User.fromJson(data!));

  Future<void> setUser(User user) =>
      _service.setData(path: FirestorePath.user(user.id), data: user.toJson());

  Future<void> updateUser(User user) => _service.setData(
      path: FirestorePath.user(user.id), data: user.toJson(), merge: true);

  Stream<List<String>> watchUsernames() {
    final reference = FirebaseFirestore.instance.collection("users");

    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        reference.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => snapshot.data()["username"].toString())
          .toList();
      return result;
    });
  }

  Future<String> getEmailFromUsername(String username) async {
    final reference = FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username);

    final snap = await reference.get();
    if (snap.docs.isEmpty) {
      return "";
    } else {
      return snap.docs[0]["email"];
    }
  }

  Future<void> updateSwipedRight(
      String userId, SwipedRightItems swipedRightItem) async {
    final userPath = FirestorePath.user(userId);

    await _service.updateArrayField(
      path: userPath,
      field: 'swipedRight',
      value: swipedRightItem.toJson(),
    );
  }
}
