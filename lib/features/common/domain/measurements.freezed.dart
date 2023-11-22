// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Measurements _$MeasurementsFromJson(Map<String, dynamic> json) {
  return _Measurements.fromJson(json);
}

/// @nodoc
mixin _$Measurements {
  double? get bust => throw _privateConstructorUsedError;
  double? get waist => throw _privateConstructorUsedError;
  double? get hips => throw _privateConstructorUsedError;
  double? get inseam => throw _privateConstructorUsedError;
  double? get sleeve => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;
  double? get sleeveLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasurementsCopyWith<Measurements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementsCopyWith<$Res> {
  factory $MeasurementsCopyWith(
          Measurements value, $Res Function(Measurements) then) =
      _$MeasurementsCopyWithImpl<$Res, Measurements>;
  @useResult
  $Res call(
      {double? bust,
      double? waist,
      double? hips,
      double? inseam,
      double? sleeve,
      double? length,
      double? sleeveLength});
}

/// @nodoc
class _$MeasurementsCopyWithImpl<$Res, $Val extends Measurements>
    implements $MeasurementsCopyWith<$Res> {
  _$MeasurementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bust = freezed,
    Object? waist = freezed,
    Object? hips = freezed,
    Object? inseam = freezed,
    Object? sleeve = freezed,
    Object? length = freezed,
    Object? sleeveLength = freezed,
  }) {
    return _then(_value.copyWith(
      bust: freezed == bust
          ? _value.bust
          : bust // ignore: cast_nullable_to_non_nullable
              as double?,
      waist: freezed == waist
          ? _value.waist
          : waist // ignore: cast_nullable_to_non_nullable
              as double?,
      hips: freezed == hips
          ? _value.hips
          : hips // ignore: cast_nullable_to_non_nullable
              as double?,
      inseam: freezed == inseam
          ? _value.inseam
          : inseam // ignore: cast_nullable_to_non_nullable
              as double?,
      sleeve: freezed == sleeve
          ? _value.sleeve
          : sleeve // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      sleeveLength: freezed == sleeveLength
          ? _value.sleeveLength
          : sleeveLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeasurementsImplCopyWith<$Res>
    implements $MeasurementsCopyWith<$Res> {
  factory _$$MeasurementsImplCopyWith(
          _$MeasurementsImpl value, $Res Function(_$MeasurementsImpl) then) =
      __$$MeasurementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? bust,
      double? waist,
      double? hips,
      double? inseam,
      double? sleeve,
      double? length,
      double? sleeveLength});
}

/// @nodoc
class __$$MeasurementsImplCopyWithImpl<$Res>
    extends _$MeasurementsCopyWithImpl<$Res, _$MeasurementsImpl>
    implements _$$MeasurementsImplCopyWith<$Res> {
  __$$MeasurementsImplCopyWithImpl(
      _$MeasurementsImpl _value, $Res Function(_$MeasurementsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bust = freezed,
    Object? waist = freezed,
    Object? hips = freezed,
    Object? inseam = freezed,
    Object? sleeve = freezed,
    Object? length = freezed,
    Object? sleeveLength = freezed,
  }) {
    return _then(_$MeasurementsImpl(
      bust: freezed == bust
          ? _value.bust
          : bust // ignore: cast_nullable_to_non_nullable
              as double?,
      waist: freezed == waist
          ? _value.waist
          : waist // ignore: cast_nullable_to_non_nullable
              as double?,
      hips: freezed == hips
          ? _value.hips
          : hips // ignore: cast_nullable_to_non_nullable
              as double?,
      inseam: freezed == inseam
          ? _value.inseam
          : inseam // ignore: cast_nullable_to_non_nullable
              as double?,
      sleeve: freezed == sleeve
          ? _value.sleeve
          : sleeve // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      sleeveLength: freezed == sleeveLength
          ? _value.sleeveLength
          : sleeveLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeasurementsImpl implements _Measurements {
  const _$MeasurementsImpl(
      {this.bust,
      this.waist,
      this.hips,
      this.inseam,
      this.sleeve,
      this.length,
      this.sleeveLength});

  factory _$MeasurementsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeasurementsImplFromJson(json);

  @override
  final double? bust;
  @override
  final double? waist;
  @override
  final double? hips;
  @override
  final double? inseam;
  @override
  final double? sleeve;
  @override
  final double? length;
  @override
  final double? sleeveLength;

  @override
  String toString() {
    return 'Measurements(bust: $bust, waist: $waist, hips: $hips, inseam: $inseam, sleeve: $sleeve, length: $length, sleeveLength: $sleeveLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementsImpl &&
            (identical(other.bust, bust) || other.bust == bust) &&
            (identical(other.waist, waist) || other.waist == waist) &&
            (identical(other.hips, hips) || other.hips == hips) &&
            (identical(other.inseam, inseam) || other.inseam == inseam) &&
            (identical(other.sleeve, sleeve) || other.sleeve == sleeve) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.sleeveLength, sleeveLength) ||
                other.sleeveLength == sleeveLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bust, waist, hips, inseam, sleeve, length, sleeveLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementsImplCopyWith<_$MeasurementsImpl> get copyWith =>
      __$$MeasurementsImplCopyWithImpl<_$MeasurementsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeasurementsImplToJson(
      this,
    );
  }
}

abstract class _Measurements implements Measurements {
  const factory _Measurements(
      {final double? bust,
      final double? waist,
      final double? hips,
      final double? inseam,
      final double? sleeve,
      final double? length,
      final double? sleeveLength}) = _$MeasurementsImpl;

  factory _Measurements.fromJson(Map<String, dynamic> json) =
      _$MeasurementsImpl.fromJson;

  @override
  double? get bust;
  @override
  double? get waist;
  @override
  double? get hips;
  @override
  double? get inseam;
  @override
  double? get sleeve;
  @override
  double? get length;
  @override
  double? get sleeveLength;
  @override
  @JsonKey(ignore: true)
  _$$MeasurementsImplCopyWith<_$MeasurementsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
