import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/user/domain/user_db.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});

final currentUserProvider = StateProvider<String>((ref) {
  return '';
});
