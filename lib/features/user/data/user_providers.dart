import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rndvouz/features/user/data/user_db.dart';
import 'package:rndvouz/features/user/domain/user.dart';

part 'user_providers.g.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});

final currentUserIdProvider = StateProvider<String>((ref) {
  return "";
});

@riverpod
Stream<List<User>> users(UsersRef ref) {
  final database = ref.watch(userDBProvider);

  return database.watchUsers();
}

@Riverpod(keepAlive: true)
Stream<User> currentUser(CurrentUserRef ref) {
  final database = ref.watch(userDBProvider);
  final currentUserId = ref.watch(currentUserIdProvider);
  return database.watchUser(currentUserId);
}

@riverpod
Future<User> fetchCurrentUser(FetchCurrentUserRef ref) {
  final database = ref.watch(userDBProvider);
  final currentUserId = ref.watch(currentUserIdProvider);
  return database.fetchUser(currentUserId);
}
