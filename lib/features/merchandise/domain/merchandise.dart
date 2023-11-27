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

// Used unfreezed instead of freezed to define a mutable class.
@unfreezed
// _$Merchandise is a mixin. It's needed to define various properties/methods.
class Merchandise with _$Merchandise {
  const Merchandise._();
  // Defining a constructor in a Freezed class.
  factory Merchandise({
    required String id,
    required String ownerUsername,
    required Availability state,
    required Purpose purpose,
    required PrimaryStyle primaryStyle,
    SecondaryStyle? secondaryStyle,
    required Garment garment,
    Set<MerchColors>? merchColors,
    required String merchName,
    @MeasurementsConverter() Measurements? merchMeasurements,
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

  String get assetId => '$id.jpg';
  String get assetImages => 'assets/images/$id';

  // @override
  // String toString() => '$title (id=$id)';
}

@unfreezed
class PriceRange with _$PriceRange {
  const PriceRange._();

  factory PriceRange({
    required double minPrice,
    required double maxPrice,
  }) = _PriceRange;

  factory PriceRange.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeFromJson(json);
}

// Custom converter
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
