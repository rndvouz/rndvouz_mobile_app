import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/repositories/firestore/firestore_providers.dart';
import 'package:rndvouz/repositories/firestore/firestore_path.dart';
import 'package:rndvouz/repositories/firestore/firestore_service.dart';

class MerchandiseDB {
  MerchandiseDB(this.ref) {
    _service = ref.read(firestoreServiceProvider);
  }

  final ProviderRef<MerchandiseDB> ref;

  late FirestoreService _service;
}
