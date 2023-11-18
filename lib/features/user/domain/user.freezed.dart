// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get isBusiness => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get favoriteColors => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  Measurements? get userMeasurements => throw _privateConstructorUsedError;
  List<String>? get style => throw _privateConstructorUsedError;
  List<String> get follower => throw _privateConstructorUsedError;
  List<String> get following => throw _privateConstructorUsedError;
  List<ContactInformation> get contact => throw _privateConstructorUsedError;
  String get setupStep => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String username,
      String email,
      bool isBusiness,
      String? displayName,
      String? imagePath,
      String? type,
      String? address,
      String? favoriteColors,
      String? biography,
      Measurements? userMeasurements,
      List<String>? style,
      List<String> follower,
      List<String> following,
      List<ContactInformation> contact,
      String setupStep});

  $MeasurementsCopyWith<$Res>? get userMeasurements;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? isBusiness = null,
    Object? displayName = freezed,
    Object? imagePath = freezed,
    Object? type = freezed,
    Object? address = freezed,
    Object? favoriteColors = freezed,
    Object? biography = freezed,
    Object? userMeasurements = freezed,
    Object? style = freezed,
    Object? follower = null,
    Object? following = null,
    Object? contact = null,
    Object? setupStep = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isBusiness: null == isBusiness
          ? _value.isBusiness
          : isBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteColors: freezed == favoriteColors
          ? _value.favoriteColors
          : favoriteColors // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      userMeasurements: freezed == userMeasurements
          ? _value.userMeasurements
          : userMeasurements // ignore: cast_nullable_to_non_nullable
              as Measurements?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<String>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as List<ContactInformation>,
      setupStep: null == setupStep
          ? _value.setupStep
          : setupStep // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MeasurementsCopyWith<$Res>? get userMeasurements {
    if (_value.userMeasurements == null) {
      return null;
    }

    return $MeasurementsCopyWith<$Res>(_value.userMeasurements!, (value) {
      return _then(_value.copyWith(userMeasurements: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String email,
      bool isBusiness,
      String? displayName,
      String? imagePath,
      String? type,
      String? address,
      String? favoriteColors,
      String? biography,
      Measurements? userMeasurements,
      List<String>? style,
      List<String> follower,
      List<String> following,
      List<ContactInformation> contact,
      String setupStep});

  @override
  $MeasurementsCopyWith<$Res>? get userMeasurements;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? isBusiness = null,
    Object? displayName = freezed,
    Object? imagePath = freezed,
    Object? type = freezed,
    Object? address = freezed,
    Object? favoriteColors = freezed,
    Object? biography = freezed,
    Object? userMeasurements = freezed,
    Object? style = freezed,
    Object? follower = null,
    Object? following = null,
    Object? contact = null,
    Object? setupStep = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isBusiness: null == isBusiness
          ? _value.isBusiness
          : isBusiness // ignore: cast_nullable_to_non_nullable
              as bool,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteColors: freezed == favoriteColors
          ? _value.favoriteColors
          : favoriteColors // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      userMeasurements: freezed == userMeasurements
          ? _value.userMeasurements
          : userMeasurements // ignore: cast_nullable_to_non_nullable
              as Measurements?,
      style: freezed == style
          ? _value._style
          : style // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      follower: null == follower
          ? _value._follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<String>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contact: null == contact
          ? _value._contact
          : contact // ignore: cast_nullable_to_non_nullable
              as List<ContactInformation>,
      setupStep: null == setupStep
          ? _value.setupStep
          : setupStep // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.username,
      required this.email,
      required this.isBusiness,
      this.displayName,
      this.imagePath,
      this.type,
      this.address,
      this.favoriteColors,
      this.biography,
      this.userMeasurements,
      final List<String>? style,
      final List<String> follower = const [],
      final List<String> following = const [],
      final List<ContactInformation> contact = const [],
      this.setupStep = "setupProfile"})
      : _style = style,
        _follower = follower,
        _following = following,
        _contact = contact,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final bool isBusiness;
  @override
  final String? displayName;
  @override
  final String? imagePath;
  @override
  final String? type;
  @override
  final String? address;
  @override
  final String? favoriteColors;
  @override
  final String? biography;
  @override
  final Measurements? userMeasurements;
  final List<String>? _style;
  @override
  List<String>? get style {
    final value = _style;
    if (value == null) return null;
    if (_style is EqualUnmodifiableListView) return _style;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _follower;
  @override
  @JsonKey()
  List<String> get follower {
    if (_follower is EqualUnmodifiableListView) return _follower;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_follower);
  }

  final List<String> _following;
  @override
  @JsonKey()
  List<String> get following {
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  final List<ContactInformation> _contact;
  @override
  @JsonKey()
  List<ContactInformation> get contact {
    if (_contact is EqualUnmodifiableListView) return _contact;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contact);
  }

  @override
  @JsonKey()
  final String setupStep;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, isBusiness: $isBusiness, displayName: $displayName, imagePath: $imagePath, type: $type, address: $address, favoriteColors: $favoriteColors, biography: $biography, userMeasurements: $userMeasurements, style: $style, follower: $follower, following: $following, contact: $contact, setupStep: $setupStep)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isBusiness, isBusiness) ||
                other.isBusiness == isBusiness) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.favoriteColors, favoriteColors) ||
                other.favoriteColors == favoriteColors) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.userMeasurements, userMeasurements) ||
                other.userMeasurements == userMeasurements) &&
            const DeepCollectionEquality().equals(other._style, _style) &&
            const DeepCollectionEquality().equals(other._follower, _follower) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            const DeepCollectionEquality().equals(other._contact, _contact) &&
            (identical(other.setupStep, setupStep) ||
                other.setupStep == setupStep));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      isBusiness,
      displayName,
      imagePath,
      type,
      address,
      favoriteColors,
      biography,
      userMeasurements,
      const DeepCollectionEquality().hash(_style),
      const DeepCollectionEquality().hash(_follower),
      const DeepCollectionEquality().hash(_following),
      const DeepCollectionEquality().hash(_contact),
      setupStep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final String username,
      required final String email,
      required final bool isBusiness,
      final String? displayName,
      final String? imagePath,
      final String? type,
      final String? address,
      final String? favoriteColors,
      final String? biography,
      final Measurements? userMeasurements,
      final List<String>? style,
      final List<String> follower,
      final List<String> following,
      final List<ContactInformation> contact,
      final String setupStep}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  bool get isBusiness;
  @override
  String? get displayName;
  @override
  String? get imagePath;
  @override
  String? get type;
  @override
  String? get address;
  @override
  String? get favoriteColors;
  @override
  String? get biography;
  @override
  Measurements? get userMeasurements;
  @override
  List<String>? get style;
  @override
  List<String> get follower;
  @override
  List<String> get following;
  @override
  List<ContactInformation> get contact;
  @override
  String get setupStep;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactInformation _$ContactInformationFromJson(Map<String, dynamic> json) {
  return _ContactInformation.fromJson(json);
}

/// @nodoc
mixin _$ContactInformation {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactInformationCopyWith<ContactInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInformationCopyWith<$Res> {
  factory $ContactInformationCopyWith(
          ContactInformation value, $Res Function(ContactInformation) then) =
      _$ContactInformationCopyWithImpl<$Res, ContactInformation>;
  @useResult
  $Res call({String name, String email, String phoneNumber});
}

/// @nodoc
class _$ContactInformationCopyWithImpl<$Res, $Val extends ContactInformation>
    implements $ContactInformationCopyWith<$Res> {
  _$ContactInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactInformationImplCopyWith<$Res>
    implements $ContactInformationCopyWith<$Res> {
  factory _$$ContactInformationImplCopyWith(_$ContactInformationImpl value,
          $Res Function(_$ContactInformationImpl) then) =
      __$$ContactInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String phoneNumber});
}

/// @nodoc
class __$$ContactInformationImplCopyWithImpl<$Res>
    extends _$ContactInformationCopyWithImpl<$Res, _$ContactInformationImpl>
    implements _$$ContactInformationImplCopyWith<$Res> {
  __$$ContactInformationImplCopyWithImpl(_$ContactInformationImpl _value,
      $Res Function(_$ContactInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$ContactInformationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactInformationImpl implements _ContactInformation {
  const _$ContactInformationImpl(
      {required this.name, required this.email, required this.phoneNumber});

  factory _$ContactInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInformationImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ContactInformation(name: $name, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInformationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInformationImplCopyWith<_$ContactInformationImpl> get copyWith =>
      __$$ContactInformationImplCopyWithImpl<_$ContactInformationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInformationImplToJson(
      this,
    );
  }
}

abstract class _ContactInformation implements ContactInformation {
  const factory _ContactInformation(
      {required final String name,
      required final String email,
      required final String phoneNumber}) = _$ContactInformationImpl;

  factory _ContactInformation.fromJson(Map<String, dynamic> json) =
      _$ContactInformationImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$ContactInformationImplCopyWith<_$ContactInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
