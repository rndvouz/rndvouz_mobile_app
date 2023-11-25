import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/domain/measurements.dart';
import 'merchandise_garment.dart';
import 'merchandise_style.dart';

part 'merchandise.freezed.dart';
part 'merchandise.g.dart';

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

enum Purpose { setup, browse, all }

@freezed
// _$Merchandise is a mixin. It's needed to define various properties/methods.
class Merchandise with _$Merchandise {
  // Constructor without parameters.
  const Merchandise._();

  // Defining a constructor in a Freezed class.
  const factory Merchandise({
    required String id,
    required String ownerUsername,
    required Availability state,
    required Purpose purpose,
    required PrimaryStyle primaryStyle,
    SecondaryStyle? secondaryStyle,
    required Garment garment,
    Set<MerchColors>? merchColors,
    required String merchName,
    required Measurements merchMeasurements,
    required SellingMethod sellingMethod,
    double? price,
    @PriceRangeConverter() PriceRange? priceRange,
    String? desiredTrade,
    required int likes,
  }) = _Merchandise;

  // fromJson constructor, for constructing a new Merchandise instance from a map structure.
  // Freezed will automatically make a toJson, which converts a Merchandise instance into a map.
  factory Merchandise.fromJson(Map<String, dynamic> json) =>
      _$MerchandiseFromJson(json);

  // String get assetId => '${Merchandise.id}.jpg';
  // String get assetImages => 'assets/images/$id';

  // @override
  // String toString() => '$title (id=$id)';
}

@freezed
class PriceRange with _$PriceRange {
  const PriceRange._();

  const factory PriceRange({
    required double minPrice,
    required double maxPrice,
  }) = _PriceRange;

  factory PriceRange.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeFromJson(json);
}

class PriceRangeConverter
    extends JsonConverter<PriceRange?, Map<String, dynamic>?> {
  const PriceRangeConverter();

  @override
  PriceRange? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PriceRange.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PriceRange? object) {
    if (object == null) {
      return null;
    }
    return object.toJson();
  }
}

// Old code
/*
class Merchandise {
  final int id;
  final String ownerUsername;
  final Availability state;
  final Purpose purpose;
  final PrimaryStyle primaryStyle;
  final SecondaryStyle? secondaryStyle;
  final Garment garment;
  final Set<MerchColors> merchColors;
  String merchName;
  Measurements merchMeasurements;
  SellingMethod sellingMethod;
  double price; // for selling
  PriceRange? priceRange; // for negotiating
  String? desiredTrade; // for trading
  int likes;

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
  final double minPrice;
  final double maxPrice;

  const PriceRange({required this.minPrice, required this.maxPrice});
}
*/
