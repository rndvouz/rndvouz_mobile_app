import 'package:app/model/garment.dart';
import 'package:app/model/style.dart';

class Merchandise {
  final PrimaryStyle primaryStyle;
  final SecondaryStyle? secondaryStyle;
  final Garment garment;
  // final String size;
  final int id;
  // final int price;
  final String merchName;
  final bool forOnboarding;

  const Merchandise({
    required this.primaryStyle,
    this.secondaryStyle,
    required this.garment,
    //required this.size,
    required this.id,
    // required this.price,
    required this.merchName,
    required this.forOnboarding,
  });

  String get assetId => '$id.jpg';
  String get assetImages => 'assets/images/$id';

  @override
  String toString() => '$merchName (id=$id)';
}
