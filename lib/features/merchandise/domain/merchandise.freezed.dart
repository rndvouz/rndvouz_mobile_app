// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchandise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Merchandise _$MerchandiseFromJson(Map<String, dynamic> json) {
  return _Merchandise.fromJson(json);
}

/// @nodoc
mixin _$Merchandise {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get ownerUsername => throw _privateConstructorUsedError;
  set ownerUsername(String value) => throw _privateConstructorUsedError;
  Availability get state => throw _privateConstructorUsedError;
  set state(Availability value) => throw _privateConstructorUsedError;
  Purpose get purpose => throw _privateConstructorUsedError;
  set purpose(Purpose value) => throw _privateConstructorUsedError;
  PrimaryStyle get primaryStyle => throw _privateConstructorUsedError;
  set primaryStyle(PrimaryStyle value) => throw _privateConstructorUsedError;
  SecondaryStyle? get secondaryStyle => throw _privateConstructorUsedError;
  set secondaryStyle(SecondaryStyle? value) =>
      throw _privateConstructorUsedError;
  Garment get garment => throw _privateConstructorUsedError;
  set garment(Garment value) => throw _privateConstructorUsedError;
  Set<MerchColors>? get merchColors => throw _privateConstructorUsedError;
  set merchColors(Set<MerchColors>? value) =>
      throw _privateConstructorUsedError;
  String get merchName => throw _privateConstructorUsedError;
  set merchName(String value) => throw _privateConstructorUsedError;
  @MeasurementsConverter()
  Measurements? get merchMeasurements => throw _privateConstructorUsedError;
  @MeasurementsConverter()
  set merchMeasurements(Measurements? value) =>
      throw _privateConstructorUsedError;
  SellingMethod get sellingMethod => throw _privateConstructorUsedError;
  set sellingMethod(SellingMethod value) => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  set price(double? value) => throw _privateConstructorUsedError;
  @PriceRangeConverter()
  PriceRange? get priceRange => throw _privateConstructorUsedError;
  @PriceRangeConverter()
  set priceRange(PriceRange? value) => throw _privateConstructorUsedError;
  String? get desiredTrade => throw _privateConstructorUsedError;
  set desiredTrade(String? value) => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  set likes(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchandiseCopyWith<Merchandise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchandiseCopyWith<$Res> {
  factory $MerchandiseCopyWith(
          Merchandise value, $Res Function(Merchandise) then) =
      _$MerchandiseCopyWithImpl<$Res, Merchandise>;
  @useResult
  $Res call(
      {String id,
      String ownerUsername,
      Availability state,
      Purpose purpose,
      PrimaryStyle primaryStyle,
      SecondaryStyle? secondaryStyle,
      Garment garment,
      Set<MerchColors>? merchColors,
      String merchName,
      @MeasurementsConverter() Measurements? merchMeasurements,
      SellingMethod sellingMethod,
      double? price,
      @PriceRangeConverter() PriceRange? priceRange,
      String? desiredTrade,
      int likes});

  $MeasurementsCopyWith<$Res>? get merchMeasurements;
  $PriceRangeCopyWith<$Res>? get priceRange;
}

/// @nodoc
class _$MerchandiseCopyWithImpl<$Res, $Val extends Merchandise>
    implements $MerchandiseCopyWith<$Res> {
  _$MerchandiseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerUsername = null,
    Object? state = null,
    Object? purpose = null,
    Object? primaryStyle = null,
    Object? secondaryStyle = freezed,
    Object? garment = null,
    Object? merchColors = freezed,
    Object? merchName = null,
    Object? merchMeasurements = freezed,
    Object? sellingMethod = null,
    Object? price = freezed,
    Object? priceRange = freezed,
    Object? desiredTrade = freezed,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUsername: null == ownerUsername
          ? _value.ownerUsername
          : ownerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Availability,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as Purpose,
      primaryStyle: null == primaryStyle
          ? _value.primaryStyle
          : primaryStyle // ignore: cast_nullable_to_non_nullable
              as PrimaryStyle,
      secondaryStyle: freezed == secondaryStyle
          ? _value.secondaryStyle
          : secondaryStyle // ignore: cast_nullable_to_non_nullable
              as SecondaryStyle?,
      garment: null == garment
          ? _value.garment
          : garment // ignore: cast_nullable_to_non_nullable
              as Garment,
      merchColors: freezed == merchColors
          ? _value.merchColors
          : merchColors // ignore: cast_nullable_to_non_nullable
              as Set<MerchColors>?,
      merchName: null == merchName
          ? _value.merchName
          : merchName // ignore: cast_nullable_to_non_nullable
              as String,
      merchMeasurements: freezed == merchMeasurements
          ? _value.merchMeasurements
          : merchMeasurements // ignore: cast_nullable_to_non_nullable
              as Measurements?,
      sellingMethod: null == sellingMethod
          ? _value.sellingMethod
          : sellingMethod // ignore: cast_nullable_to_non_nullable
              as SellingMethod,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRange?,
      desiredTrade: freezed == desiredTrade
          ? _value.desiredTrade
          : desiredTrade // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MeasurementsCopyWith<$Res>? get merchMeasurements {
    if (_value.merchMeasurements == null) {
      return null;
    }

    return $MeasurementsCopyWith<$Res>(_value.merchMeasurements!, (value) {
      return _then(_value.copyWith(merchMeasurements: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceRangeCopyWith<$Res>? get priceRange {
    if (_value.priceRange == null) {
      return null;
    }

    return $PriceRangeCopyWith<$Res>(_value.priceRange!, (value) {
      return _then(_value.copyWith(priceRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MerchandiseImplCopyWith<$Res>
    implements $MerchandiseCopyWith<$Res> {
  factory _$$MerchandiseImplCopyWith(
          _$MerchandiseImpl value, $Res Function(_$MerchandiseImpl) then) =
      __$$MerchandiseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerUsername,
      Availability state,
      Purpose purpose,
      PrimaryStyle primaryStyle,
      SecondaryStyle? secondaryStyle,
      Garment garment,
      Set<MerchColors>? merchColors,
      String merchName,
      @MeasurementsConverter() Measurements? merchMeasurements,
      SellingMethod sellingMethod,
      double? price,
      @PriceRangeConverter() PriceRange? priceRange,
      String? desiredTrade,
      int likes});

  @override
  $MeasurementsCopyWith<$Res>? get merchMeasurements;
  @override
  $PriceRangeCopyWith<$Res>? get priceRange;
}

/// @nodoc
class __$$MerchandiseImplCopyWithImpl<$Res>
    extends _$MerchandiseCopyWithImpl<$Res, _$MerchandiseImpl>
    implements _$$MerchandiseImplCopyWith<$Res> {
  __$$MerchandiseImplCopyWithImpl(
      _$MerchandiseImpl _value, $Res Function(_$MerchandiseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerUsername = null,
    Object? state = null,
    Object? purpose = null,
    Object? primaryStyle = null,
    Object? secondaryStyle = freezed,
    Object? garment = null,
    Object? merchColors = freezed,
    Object? merchName = null,
    Object? merchMeasurements = freezed,
    Object? sellingMethod = null,
    Object? price = freezed,
    Object? priceRange = freezed,
    Object? desiredTrade = freezed,
    Object? likes = null,
  }) {
    return _then(_$MerchandiseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUsername: null == ownerUsername
          ? _value.ownerUsername
          : ownerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Availability,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as Purpose,
      primaryStyle: null == primaryStyle
          ? _value.primaryStyle
          : primaryStyle // ignore: cast_nullable_to_non_nullable
              as PrimaryStyle,
      secondaryStyle: freezed == secondaryStyle
          ? _value.secondaryStyle
          : secondaryStyle // ignore: cast_nullable_to_non_nullable
              as SecondaryStyle?,
      garment: null == garment
          ? _value.garment
          : garment // ignore: cast_nullable_to_non_nullable
              as Garment,
      merchColors: freezed == merchColors
          ? _value.merchColors
          : merchColors // ignore: cast_nullable_to_non_nullable
              as Set<MerchColors>?,
      merchName: null == merchName
          ? _value.merchName
          : merchName // ignore: cast_nullable_to_non_nullable
              as String,
      merchMeasurements: freezed == merchMeasurements
          ? _value.merchMeasurements
          : merchMeasurements // ignore: cast_nullable_to_non_nullable
              as Measurements?,
      sellingMethod: null == sellingMethod
          ? _value.sellingMethod
          : sellingMethod // ignore: cast_nullable_to_non_nullable
              as SellingMethod,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRange?,
      desiredTrade: freezed == desiredTrade
          ? _value.desiredTrade
          : desiredTrade // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchandiseImpl extends _Merchandise {
  _$MerchandiseImpl(
      {required this.id,
      required this.ownerUsername,
      required this.state,
      required this.purpose,
      required this.primaryStyle,
      this.secondaryStyle,
      required this.garment,
      this.merchColors,
      required this.merchName,
      @MeasurementsConverter() this.merchMeasurements,
      required this.sellingMethod,
      this.price,
      @PriceRangeConverter() this.priceRange,
      this.desiredTrade,
      required this.likes})
      : super._();

  factory _$MerchandiseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchandiseImplFromJson(json);

  @override
  String id;
  @override
  String ownerUsername;
  @override
  Availability state;
  @override
  Purpose purpose;
  @override
  PrimaryStyle primaryStyle;
  @override
  SecondaryStyle? secondaryStyle;
  @override
  Garment garment;
  @override
  Set<MerchColors>? merchColors;
  @override
  String merchName;
  @override
  @MeasurementsConverter()
  Measurements? merchMeasurements;
  @override
  SellingMethod sellingMethod;
  @override
  double? price;
  @override
  @PriceRangeConverter()
  PriceRange? priceRange;
  @override
  String? desiredTrade;
  @override
  int likes;

  @override
  String toString() {
    return 'Merchandise(id: $id, ownerUsername: $ownerUsername, state: $state, purpose: $purpose, primaryStyle: $primaryStyle, secondaryStyle: $secondaryStyle, garment: $garment, merchColors: $merchColors, merchName: $merchName, merchMeasurements: $merchMeasurements, sellingMethod: $sellingMethod, price: $price, priceRange: $priceRange, desiredTrade: $desiredTrade, likes: $likes)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchandiseImplCopyWith<_$MerchandiseImpl> get copyWith =>
      __$$MerchandiseImplCopyWithImpl<_$MerchandiseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchandiseImplToJson(
      this,
    );
  }
}

abstract class _Merchandise extends Merchandise {
  factory _Merchandise(
      {required String id,
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
      required int likes}) = _$MerchandiseImpl;
  _Merchandise._() : super._();

  factory _Merchandise.fromJson(Map<String, dynamic> json) =
      _$MerchandiseImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get ownerUsername;
  set ownerUsername(String value);
  @override
  Availability get state;
  set state(Availability value);
  @override
  Purpose get purpose;
  set purpose(Purpose value);
  @override
  PrimaryStyle get primaryStyle;
  set primaryStyle(PrimaryStyle value);
  @override
  SecondaryStyle? get secondaryStyle;
  set secondaryStyle(SecondaryStyle? value);
  @override
  Garment get garment;
  set garment(Garment value);
  @override
  Set<MerchColors>? get merchColors;
  set merchColors(Set<MerchColors>? value);
  @override
  String get merchName;
  set merchName(String value);
  @override
  @MeasurementsConverter()
  Measurements? get merchMeasurements;
  @MeasurementsConverter()
  set merchMeasurements(Measurements? value);
  @override
  SellingMethod get sellingMethod;
  set sellingMethod(SellingMethod value);
  @override
  double? get price;
  set price(double? value);
  @override
  @PriceRangeConverter()
  PriceRange? get priceRange;
  @PriceRangeConverter()
  set priceRange(PriceRange? value);
  @override
  String? get desiredTrade;
  set desiredTrade(String? value);
  @override
  int get likes;
  set likes(int value);
  @override
  @JsonKey(ignore: true)
  _$$MerchandiseImplCopyWith<_$MerchandiseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceRange _$PriceRangeFromJson(Map<String, dynamic> json) {
  return _PriceRange.fromJson(json);
}

/// @nodoc
mixin _$PriceRange {
  double get minPrice => throw _privateConstructorUsedError;
  set minPrice(double value) => throw _privateConstructorUsedError;
  double get maxPrice => throw _privateConstructorUsedError;
  set maxPrice(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceRangeCopyWith<PriceRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRangeCopyWith<$Res> {
  factory $PriceRangeCopyWith(
          PriceRange value, $Res Function(PriceRange) then) =
      _$PriceRangeCopyWithImpl<$Res, PriceRange>;
  @useResult
  $Res call({double minPrice, double maxPrice});
}

/// @nodoc
class _$PriceRangeCopyWithImpl<$Res, $Val extends PriceRange>
    implements $PriceRangeCopyWith<$Res> {
  _$PriceRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
  }) {
    return _then(_value.copyWith(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceRangeImplCopyWith<$Res>
    implements $PriceRangeCopyWith<$Res> {
  factory _$$PriceRangeImplCopyWith(
          _$PriceRangeImpl value, $Res Function(_$PriceRangeImpl) then) =
      __$$PriceRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double minPrice, double maxPrice});
}

/// @nodoc
class __$$PriceRangeImplCopyWithImpl<$Res>
    extends _$PriceRangeCopyWithImpl<$Res, _$PriceRangeImpl>
    implements _$$PriceRangeImplCopyWith<$Res> {
  __$$PriceRangeImplCopyWithImpl(
      _$PriceRangeImpl _value, $Res Function(_$PriceRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
  }) {
    return _then(_$PriceRangeImpl(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceRangeImpl extends _PriceRange {
  _$PriceRangeImpl({required this.minPrice, required this.maxPrice})
      : super._();

  factory _$PriceRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceRangeImplFromJson(json);

  @override
  double minPrice;
  @override
  double maxPrice;

  @override
  String toString() {
    return 'PriceRange(minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceRangeImplCopyWith<_$PriceRangeImpl> get copyWith =>
      __$$PriceRangeImplCopyWithImpl<_$PriceRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceRangeImplToJson(
      this,
    );
  }
}

abstract class _PriceRange extends PriceRange {
  factory _PriceRange({required double minPrice, required double maxPrice}) =
      _$PriceRangeImpl;
  _PriceRange._() : super._();

  factory _PriceRange.fromJson(Map<String, dynamic> json) =
      _$PriceRangeImpl.fromJson;

  @override
  double get minPrice;
  set minPrice(double value);
  @override
  double get maxPrice;
  set maxPrice(double value);
  @override
  @JsonKey(ignore: true)
  _$$PriceRangeImplCopyWith<_$PriceRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
