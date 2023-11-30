import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_db.dart';

import '../../merchandise/domain/merchandise.dart';

SellingMethod curState = SellingMethod.trading;
MerchandiseDB? item;

final uploadItemProvider = Provider<MerchandiseDB?>((ref) => item);

final sellingMethodStateProvider =
    StateProvider<SellingMethod?>((ref) => curState);
