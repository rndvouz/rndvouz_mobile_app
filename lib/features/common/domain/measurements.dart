import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurements.freezed.dart';
part 'measurements.g.dart';

@unfreezed
class Measurements with _$Measurements {
  const Measurements._();
  factory Measurements({
    double? bust,
    double? waist,
    double? hips,
    double? inseam,
    double? sleeve,
    double? length,
    double? sleeveLength,
  }) = _Measurements;

  factory Measurements.fromJson(Map<String, dynamic> json) =>
      _$MeasurementsFromJson(json);
}

// Custom converter
class MeasurementsConverter
    extends JsonConverter<Measurements?, Map<String, dynamic>?> {
  const MeasurementsConverter();

  @override
  Measurements? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Measurements.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(Measurements? object) {
    if (object == null) {
      return null;
    }
    return object.toJson();
  }
}
