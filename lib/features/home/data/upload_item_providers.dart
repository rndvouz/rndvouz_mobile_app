import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_db.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_garment.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_style.dart';

import '../../merchandise/domain/merchandise.dart';

SellingMethod curState = SellingMethod.trading;
MerchandiseDB? item;
Garment selectedGarment = Garment.shirt;
PrimaryStyle primaryStyle = PrimaryStyle.casual;
SecondaryStyle secondaryStyle = SecondaryStyle.casual;

final sellingMethodStateProvider =
    StateProvider<SellingMethod?>((ref) => SellingMethod.negotiate);

final selectedGarmentProvider =
    StateProvider<Garment>((ref) => selectedGarment);

final primaryStyleProvider = StateProvider<PrimaryStyle>((ref) => primaryStyle);

final secondaryStyleProvider =
    StateProvider<SecondaryStyle>((ref) => secondaryStyle);

final imagePathProvider = StateProvider<String>((ref) => "");
