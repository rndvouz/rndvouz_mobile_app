import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurements.freezed.dart';
part 'measurements.g.dart';

@freezed
class Measurements with _$Measurements{
  const factory Measurements({
    double? bust,
    double? waist,
    double? hips,
    double? inseam,
    double? sleeve,
    double? length,
    double? sleeveLength,
  }) = _Measurements;

  factory Measurements.fromJson(Map<String, dynamic> json) => _$MeasurementsFromJson(json);
}
