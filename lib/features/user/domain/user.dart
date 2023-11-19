import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rndvouz/features/common/domain/measurements.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required String id,
    required String username,
    required String email,
    required bool isBusiness,
    String? displayName,
    String? imagePath,
    String? type,
    String? address,
    String? favoriteColors,
    String? biography,
    @MeasurementsConverter() Measurements? userMeasurements,
    List<String>? style,
    @Default([]) List<String> follower,
    @Default([]) List<String> following,
    @Default([]) List<ContactInformation> contact,
    @Default("setupBegin") String setupStep,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static bool isEmailValid(String email) {
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }
}

@freezed
class ContactInformation with _$ContactInformation {
  const factory ContactInformation({
    required String name,
    required String email,
    required String phoneNumber,
  }) = _ContactInformation;

  factory ContactInformation.fromJson(Map<String, dynamic> json) =>
      _$ContactInformationFromJson(json);
}

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
