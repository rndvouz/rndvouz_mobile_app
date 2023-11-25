import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/repositories/firestore/firestore_providers.dart';
import 'package:rndvouz/repositories/firestore/firestore_path.dart';
import 'package:rndvouz/repositories/firestore/firestore_service.dart';

import '../domain/merchandise.dart';
import '../domain/merchandise_garment.dart';

class MerchandiseDB {
  MerchandiseDB(this.ref) {
    _service = ref.read(firestoreServiceProvider);
  }

  // Riverpod provider.
  final ProviderRef<MerchandiseDB> ref;

  // Firebase/Firestore
  late FirestoreService _service;

  Stream<List<Merchandise>> watchMerchandises() => _service.watchCollection(
      path: FirestorePath.merchandises(),
      builder: (data, documentID) => Merchandise.fromJson(data!));

  Stream<Merchandise> watchMerchandise(String merchID) =>
      _service.watchDocument(
          path: FirestorePath.merchandise(merchID),
          builder: (data, documentID) => Merchandise.fromJson(data!));

  Future<List<Merchandise>> fetchMerchandises() => _service.fetchCollection(
      path: FirestorePath.merchandises(),
      builder: (data, documentId) => Merchandise.fromJson(data!));

  Future<Merchandise> fetchMerchandise(String merchID) =>
      _service.fetchDocument(
          path: FirestorePath.merchandise(merchID),
          builder: (data, documentId) => Merchandise.fromJson(data!));

  Future<void> setMerchandise(Merchandise merch) => _service.setData(
      path: FirestorePath.merchandise(merch.id), data: merch.toJson());

  Future<void> updateMerchandise(Merchandise merch) => _service.setData(
      path: FirestorePath.merchandise(merch.id),
      data: merch.toJson(),
      merge: true);

  Future<List<Merchandise>> findByOwnerAndState(
      // Future<dynamic> findByOwnerAndState(
      String owner,
      Availability availability) async {
    // Access the entire Firestore collection of merchandise.
    final reference = FirebaseFirestore.instance
        .collection("merchandise")
        // Makes a query object tha returns results based on parameters.
        .where((m) => m.ownerUsername == owner && m.state == availability);

    // Need to use get() to retrieve the results from the query object.
    // This is a snapshot of the query object (QuerySnapshot).
    final snap = await reference.get();

    return snap.docs
        .map((doc) => Merchandise(
              id: doc.id,
              ownerUsername: doc.data()["ownerUsername"],
              state: doc.data()["state"],
              purpose: doc.data()["purpose"],
              primaryStyle: doc.data()["primaryStyle"],
              garment: doc.data()["garment"],
              merchName: doc.data()["merchName"],
              merchMeasurements: doc.data()["merchMeasurements"],
              sellingMethod: doc.data()["sellingMethod"],
              likes: doc.data()["likes"],
            ))
        .toList();
  }

  Future<List<Merchandise>> loadMerchanise(Purpose purpose,
      // Future<QuerySnapshot<Map<String, dynamic>>> loadMerchanise(Purpose purpose,
      [Garment? garment,
      String? owner]) async {
    Query<Map<String, dynamic>> reference =
        FirebaseFirestore.instance.collection("merchandise");
    if (purpose != Purpose.all) {
      // use for searching feature
      reference = reference.where((Merchandise m) {
        // Check if garment is provided and matches
        final garmentMatches = garment == null || m.garment == garment;
        return m.purpose == purpose && garmentMatches;
      });
    }
    final snap = await reference.get();

    return snap.docs
        .map((doc) => Merchandise(
              id: doc.id,
              ownerUsername: doc.data()["ownerUsername"],
              state: doc.data()["state"],
              purpose: doc.data()["purpose"],
              primaryStyle: doc.data()["primaryStyle"],
              garment: doc.data()["garment"],
              merchName: doc.data()["merchName"],
              merchMeasurements: doc.data()["merchMeasurements"],
              sellingMethod: doc.data()["sellingMethod"],
              likes: doc.data()["likes"],
            ))
        .toList();
  }
}
