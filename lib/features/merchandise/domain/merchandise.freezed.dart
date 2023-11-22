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
  String get owner => throw _privateConstructorUsedError;
  Availability get availability => throw _privateConstructorUsedError;
  Purpose get purpose => throw _privateConstructorUsedError;
  PrimaryStyle get primaryStyle => throw _privateConstructorUsedError;
  SecondaryStyle? get secondaryStyle => throw _privateConstructorUsedError;
  Garment get garment => throw _privateConstructorUsedError;
  Set<MerchColors>? get colors => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Measurements get measurements => throw _privateConstructorUsedError;
  SellingMethod get sellingMethod => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @PriceRangeConverter()
  PriceRange? get priceRange => throw _privateConstructorUsedError;
  String? get desiredTrade => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;

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
      String owner,
      Availability availability,
      Purpose purpose,
      PrimaryStyle primaryStyle,
      SecondaryStyle? secondaryStyle,
      Garment garment,
      Set<MerchColors>? colors,
      String title,
      Measurements measurements,
      SellingMethod sellingMethod,
      double price,
      @PriceRangeConverter() PriceRange? priceRange,
      String? desiredTrade,
      int likes});

  $MeasurementsCopyWith<$Res> get measurements;
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
    Object? owner = null,
    Object? availability = null,
    Object? purpose = null,
    Object? primaryStyle = null,
    Object? secondaryStyle = freezed,
    Object? garment = null,
    Object? colors = freezed,
    Object? title = null,
    Object? measurements = null,
    Object? sellingMethod = null,
    Object? price = null,
    Object? priceRange = freezed,
    Object? desiredTrade = freezed,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
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
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Set<MerchColors>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      measurements: null == measurements
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as Measurements,
      sellingMethod: null == sellingMethod
          ? _value.sellingMethod
          : sellingMethod // ignore: cast_nullable_to_non_nullable
              as SellingMethod,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
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
  $MeasurementsCopyWith<$Res> get measurements {
    return $MeasurementsCopyWith<$Res>(_value.measurements, (value) {
      return _then(_value.copyWith(measurements: value) as $Val);
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
      String owner,
      Availability availability,
      Purpose purpose,
      PrimaryStyle primaryStyle,
      SecondaryStyle? secondaryStyle,
      Garment garment,
      Set<MerchColors>? colors,
      String title,
      Measurements measurements,
      SellingMethod sellingMethod,
      double price,
      @PriceRangeConverter() PriceRange? priceRange,
      String? desiredTrade,
      int likes});

  @override
  $MeasurementsCopyWith<$Res> get measurements;
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
    Object? owner = null,
    Object? availability = null,
    Object? purpose = null,
    Object? primaryStyle = null,
    Object? secondaryStyle = freezed,
    Object? garment = null,
    Object? colors = freezed,
    Object? title = null,
    Object? measurements = null,
    Object? sellingMethod = null,
    Object? price = null,
    Object? priceRange = freezed,
    Object? desiredTrade = freezed,
    Object? likes = null,
  }) {
    return _then(_$MerchandiseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
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
      colors: freezed == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Set<MerchColors>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      measurements: null == measurements
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as Measurements,
      sellingMethod: null == sellingMethod
          ? _value.sellingMethod
          : sellingMethod // ignore: cast_nullable_to_non_nullable
              as SellingMethod,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
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
  const _$MerchandiseImpl(
      {required this.id,
      required this.owner,
      required this.availability,
      required this.purpose,
      required this.primaryStyle,
      this.secondaryStyle,
      required this.garment,
      final Set<MerchColors>? colors,
      required this.title,
      required this.measurements,
      required this.sellingMethod,
      required this.price,
      @PriceRangeConverter() this.priceRange,
      this.desiredTrade,
      required this.likes})
      : _colors = colors,
        super._();

  factory _$MerchandiseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchandiseImplFromJson(json);

  @override
  final String id;
  @override
  final String owner;
  @override
  final Availability availability;
  @override
  final Purpose purpose;
  @override
  final PrimaryStyle primaryStyle;
  @override
  final SecondaryStyle? secondaryStyle;
  @override
  final Garment garment;
  final Set<MerchColors>? _colors;
  @override
  Set<MerchColors>? get colors {
    final value = _colors;
    if (value == null) return null;
    if (_colors is EqualUnmodifiableSetView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  final String title;
  @override
  final Measurements measurements;
  @override
  final SellingMethod sellingMethod;
  @override
  final double price;
  @override
  @PriceRangeConverter()
  final PriceRange? priceRange;
  @override
  final String? desiredTrade;
  @override
  final int likes;

  @override
  String toString() {
    return 'Merchandise(id: $id, owner: $owner, availability: $availability, purpose: $purpose, primaryStyle: $primaryStyle, secondaryStyle: $secondaryStyle, garment: $garment, colors: $colors, title: $title, measurements: $measurements, sellingMethod: $sellingMethod, price: $price, priceRange: $priceRange, desiredTrade: $desiredTrade, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchandiseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.primaryStyle, primaryStyle) ||
                other.primaryStyle == primaryStyle) &&
            (identical(other.secondaryStyle, secondaryStyle) ||
                other.secondaryStyle == secondaryStyle) &&
            (identical(other.garment, garment) || other.garment == garment) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.measurements, measurements) ||
                other.measurements == measurements) &&
            (identical(other.sellingMethod, sellingMethod) ||
                other.sellingMethod == sellingMethod) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.desiredTrade, desiredTrade) ||
                other.desiredTrade == desiredTrade) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      owner,
      availability,
      purpose,
      primaryStyle,
      secondaryStyle,
      garment,
      const DeepCollectionEquality().hash(_colors),
      title,
      measurements,
      sellingMethod,
      price,
      priceRange,
      desiredTrade,
      likes);

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
  const factory _Merchandise(
      {required final String id,
      required final String owner,
      required final Availability availability,
      required final Purpose purpose,
      required final PrimaryStyle primaryStyle,
      final SecondaryStyle? secondaryStyle,
      required final Garment garment,
      final Set<MerchColors>? colors,
      required final String title,
      required final Measurements measurements,
      required final SellingMethod sellingMethod,
      required final double price,
      @PriceRangeConverter() final PriceRange? priceRange,
      final String? desiredTrade,
      required final int likes}) = _$MerchandiseImpl;
  const _Merchandise._() : super._();

  factory _Merchandise.fromJson(Map<String, dynamic> json) =
      _$MerchandiseImpl.fromJson;

  @override
  String get id;
  @override
  String get owner;
  @override
  Availability get availability;
  @override
  Purpose get purpose;
  @override
  PrimaryStyle get primaryStyle;
  @override
  SecondaryStyle? get secondaryStyle;
  @override
  Garment get garment;
  @override
  Set<MerchColors>? get colors;
  @override
  String get title;
  @override
  Measurements get measurements;
  @override
  SellingMethod get sellingMethod;
  @override
  double get price;
  @override
  @PriceRangeConverter()
  PriceRange? get priceRange;
  @override
  String? get desiredTrade;
  @override
  int get likes;
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
  double get maxPrice => throw _privateConstructorUsedError;

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
  const _$PriceRangeImpl({required this.minPrice, required this.maxPrice})
      : super._();

  factory _$PriceRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceRangeImplFromJson(json);

  @override
  final double minPrice;
  @override
  final double maxPrice;

  @override
  String toString() {
    return 'PriceRange(minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceRangeImpl &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minPrice, maxPrice);

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
  const factory _PriceRange(
      {required final double minPrice,
      required final double maxPrice}) = _$PriceRangeImpl;
  const _PriceRange._() : super._();

  factory _PriceRange.fromJson(Map<String, dynamic> json) =
      _$PriceRangeImpl.fromJson;

  @override
  double get minPrice;
  @override
  double get maxPrice;
  @override
  @JsonKey(ignore: true)
  _$$PriceRangeImplCopyWith<_$PriceRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
