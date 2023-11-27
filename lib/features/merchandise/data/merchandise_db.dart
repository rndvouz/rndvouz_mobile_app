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

  // Future<List<Merchandise>> filterSearch() {

  // }
}
