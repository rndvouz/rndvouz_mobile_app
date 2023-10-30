import 'package:rndvouz/features/common/domain/measurements.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  String username;
  String? displayName;
  String email;
  String password;
  String? imagePath;
  List<String>? follower;
  List<String>? following;
  Measurements? userMeasurements;
  String? type;
  String? address;
  List<String>? style;
  String? favoriteColors;
  String? biography;
  bool isBusiness;
  List<ContactInformation>? contact;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.isBusiness,
    this.displayName,
    this.imagePath,
    List<String>? follower,
    List<String>? following,
    this.userMeasurements,
    this.type,
    this.address,
    this.style,
    this.favoriteColors,
    this.biography,
    List<ContactInformation>? contact,
  })  : follower = follower ?? <String>[],
        following = following ?? <String>[],
        contact = contact ?? <ContactInformation>[];
}

class ContactInformation {
  String name;
  String email;
  String phoneNumber;

  ContactInformation(
      {required this.email, required this.name, required this.phoneNumber});
}

class UserDB {
  UserDB(this.ref);
  final ProviderRef<UserDB> ref;
  final List<User> _users = [
    User(
        username: 'Eric Beck',
        email: 'eric@hawaii.edu',
        password: 'ericPass',
        isBusiness: false),
    User(
        username: 'Michael Smith ',
        email: 'michael@hawaii.edu',
        password: 'michaelPass',
        isBusiness: false),
    User(
        username: 'test',
        email: 'test@hawaii.edu',
        password: 'testPass',
        isBusiness: false),
    User(
        username: 'amyw',
        email: 'amywong@hawaii.edu',
        password: '12345678',
        isBusiness: false),
    User(
        username: 'sams',
        email: 'samsm@hawaii.edu',
        password: '12345678',
        isBusiness: false),
    User(
        username: 'l',
        email: 'l@l.com',
        password: 'llllllll',
        isBusiness: false)
  ];

  User getUser(String username) {
    return _users.firstWhere((user) => user.username == username);
  }

  void validateUser(User newUser) {
    if (isEmailValid(newUser.email)) {
      if (_users.any((user) => user.email == newUser.email)) {
        throw Exception("Email has been used");
      }
    } else {
      throw Exception("Invalid email format");
    }

    if (newUser.username.isNotEmpty && newUser.username.length < 21) {
      if (_users.any((user) => user.username == newUser.username)) {
        throw Exception("Username has been used!");
      }
      newUser.displayName = newUser.username;
    } else {
      throw Exception("Username must be between 1 and 20 characters.");
    }

    if (newUser.password.length < 8) {
      throw Exception("Password must be at least 8 characters.");
    }
  }

  void addUser(User newUser) {
    validateUser(newUser);

    _users.add(newUser);
  }

  bool isEmailValid(String email) {
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  bool isUserInDatabase(User user, List<User> database) {
    return database.contains(user);
  }

  void updateUserProfileFields(
    User user, {
    String? displayName,
    String? biography,
    String? newUsername,
  }) {
    if (displayName != null) user.displayName = displayName;

    if (user.username != newUsername) {
      if (newUsername != null &&
          newUsername.isNotEmpty &&
          newUsername.length < 21) {
        if (_users.any((user) => user.username == newUsername)) {
          throw Exception("Username has been used!");
        }
        user.username = newUsername;
      } else {
        throw Exception("Username must be between 1 and 20 characters.");
      }
    }
    if (biography != null) user.biography = biography;
  }

  // Future<void> addContact(User user,
  //     {required String name,
  //     required String email,
  //     required String phone}) async {
  //   bool isPhoneValid =
  //       await PhoneNumberUtil().validate(phone, regionCode: 'US');

  //   if (!isEmailValid(email) || !isPhoneValid) {
  //     throw Exception('Unvalid emmail or phone number.');
  //   }

  //   Map<String, String> contactToAdd = {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //   };

  //   user.contactBusiness?.add(contactToAdd);
  // }
}

