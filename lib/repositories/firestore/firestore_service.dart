import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/global_navigator_key.dart';
import 'package:rndvouz/features/setup_process/presentation/get_started.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:rndvouz/repositories/firestore/firestore_providers.dart';

/// Generic interface for accessing Firestore.
class FirestoreService {
  // Make the class non-instantiable outside this file.
  FirestoreService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen(authStateChangesProvider, (prev, next) async {
      print("prev: ${prev?.value}");
      print("next: ${next.value}");
      if (prev?.value == null && next.value != null) {
        // We are signed in
        ref.read(currentUserIdProvider.notifier).state = next.value!.uid;
        String routeName = "/home";
        if (!next.value!.emailVerified) {
          routeName = "/verify";
        } else {
          // email is verified, check setup process stage
          final user = await ref.read(fetchCurrentUserProvider.future);
          if (user.setupStep != "completed") {
            routeName = GetStartedPage.routeName;
          }
        }
        GlobalNavigatorKey.navigatorKey.currentState!
            .pushNamedAndRemoveUntil(routeName, (route) => false);
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        // });
      }

      if (prev != null && next.value == null) {
        // We are signed out
        ref.read(currentUserIdProvider.notifier).state = "";
        GlobalNavigatorKey.navigatorKey.currentState!
            .pushNamedAndRemoveUntil("/login", (route) => false);
      }
    });
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    await FirebaseFirestore.instance.collection(collection).add(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.delete();
  }

  Stream<List<T>> watchCollection<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> watchDocument<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final DocumentReference<Map<String, dynamic>> reference =
        FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots =
        reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  /// Fetch a snapshot of a collection.
  Future<List<T>> fetchCollection<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) async {
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final snapshot = await query.get();
    final result = snapshot.docs
        .map((snapshot) => builder(snapshot.data(), snapshot.id))
        .where((value) => value != null)
        .toList();
    if (sort != null) {
      result.sort(sort);
    }
    return result;
  }

  /// Fetch a snapshot of a document.
  /// Not (yet) used in this app.
  Future<T> fetchDocument<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshot = await reference.get();
    return builder(snapshot.data(), snapshot.id);
  }

  Future<void> updateArrayField({
    required String path,
    required String field,
    required dynamic value,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    Map<String, dynamic> updateData = {
      field: FieldValue.arrayUnion([value])
    };

    await reference.update(updateData);
  }
}
