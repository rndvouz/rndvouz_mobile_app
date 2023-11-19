import '../../common/domain/measurements.dart';
import 'merchandise_garment.dart';
import 'merchandise_style.dart';

enum Availability { selling, sold }

enum SellingMethod { selling, negotiate, trading }

enum MerchColors {
  red,
  orange,
  yellow,
  green,
  blue,
  indigo,
  purple,
  gray,
  black,
  white,
  brown,
  tan,
  beige
}

enum Purpose { setup, browse, search, all }

class Merchandise {
  final int id;
  final String ownerUsername;
  final Availability state;
  final Purpose purpose;
  final PrimaryStyle primaryStyle;
  final SecondaryStyle? secondaryStyle;
  final Garment garment;
  final Set<MerchColors> merchColors;
  final String merchName;
  final Measurements merchMeasurements;
  final SellingMethod sellingMethod;
  final int price; // for selling
  final PriceRange? priceRange; // for negotiating
  final String? desiredTrade; // for trading
  final int likes;

  Merchandise({
    required this.id,
    required this.ownerUsername,
    required this.state,
    required this.purpose,
    required this.primaryStyle,
    this.secondaryStyle,
    required this.garment,
    required this.merchColors,
    required this.merchName,
    required this.merchMeasurements,
    required this.sellingMethod,
    this.price = 0,
    this.priceRange, // default null
    this.desiredTrade, // default null
    this.likes = 0, // default value
  });

  String get assetId => '$id.jpg';
  String get assetImages => 'assets/images/$id';

  @override
  String toString() => '$merchName (id=$id)';
}

class PriceRange {
  final int minPrice;
  final int maxPrice;

  const PriceRange({required this.minPrice, required this.maxPrice});
}
