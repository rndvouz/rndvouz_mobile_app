import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/user/data/user_db.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:rndvouz/features/user/domain/user.dart';

part 'all_data_provider.g.dart';

class AllData {
  AllData(
      {required this.users,
      required this.merchandise,
      required this.currentUser});

  final UserDB users;
  final List<Merchandise> merchandise;
  final User currentUser;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final users = ref.watch(userDBProvider);
  final merchandise = ref.watch(merchandiseProvider.future);
  final currentUser = ref.watch(currentUserProvider.future);
  return AllData(
      users: users,
      merchandise: await merchandise,
      currentUser: await currentUser);
}
