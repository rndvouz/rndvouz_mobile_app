// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      isBusiness: json['isBusiness'] as bool,
      displayName: json['displayName'] as String?,
      imagePath: json['imagePath'] as String?,
      type: json['type'] as String?,
      address: json['address'] as String?,
      favoriteColors: json['favoriteColors'] as String?,
      biography: json['biography'] as String?,
      userMeasurements: json['userMeasurements'] == null
          ? null
          : Measurements.fromJson(
              json['userMeasurements'] as Map<String, dynamic>),
      style:
          (json['style'] as List<dynamic>?)?.map((e) => e as String).toList(),
      follower: (json['follower'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      contact: (json['contact'] as List<dynamic>?)
              ?.map(
                  (e) => ContactInformation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'isBusiness': instance.isBusiness,
      'displayName': instance.displayName,
      'imagePath': instance.imagePath,
      'type': instance.type,
      'address': instance.address,
      'favoriteColors': instance.favoriteColors,
      'biography': instance.biography,
      'userMeasurements': instance.userMeasurements,
      'style': instance.style,
      'follower': instance.follower,
      'following': instance.following,
      'contact': instance.contact,
    };

_$ContactInformationImpl _$$ContactInformationImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactInformationImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$ContactInformationImplToJson(
        _$ContactInformationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
