// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeasurementsImpl _$$MeasurementsImplFromJson(Map<String, dynamic> json) =>
    _$MeasurementsImpl(
      bust: (json['bust'] as num?)?.toDouble(),
      waist: (json['waist'] as num?)?.toDouble(),
      hips: (json['hips'] as num?)?.toDouble(),
      inseam: (json['inseam'] as num?)?.toDouble(),
      sleeve: (json['sleeve'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      sleeveLength: (json['sleeveLength'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MeasurementsImplToJson(_$MeasurementsImpl instance) =>
    <String, dynamic>{
      'bust': instance.bust,
      'waist': instance.waist,
      'hips': instance.hips,
      'inseam': instance.inseam,
      'sleeve': instance.sleeve,
      'length': instance.length,
      'sleeveLength': instance.sleeveLength,
    };
