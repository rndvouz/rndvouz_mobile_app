import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

import 'merchandise_db.dart';

part 'merchandise_providers.g.dart';

final merchandiseDBProvider = Provider<MerchandiseDB>((ref) {
  return MerchandiseDB(ref);
});

@riverpod
Stream<List<Merchandise>> merchandise(MerchandiseRef ref) {
  final database = ref.watch(merchandiseDBProvider);

  return database.watchMerchandises();
}
