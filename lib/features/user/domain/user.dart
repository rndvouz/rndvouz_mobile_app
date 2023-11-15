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
    Measurements? userMeasurements,
    List<String>? style,
    @Default([]) List<String> follower,
    @Default([]) List<String> following,
    @Default([]) List<ContactInformation> contact,
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
