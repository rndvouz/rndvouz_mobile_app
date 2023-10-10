class User {
  String username;
  String? displayName;
  String email;
  String password;
  String? imagePath;
  List<String>? follower;
  List<String>? following;
  Map<String, double>? measurements;
  String? type;
  String? address;
  String? style;
  String? favoriteColors;
  String? biography;

  User({
    required this.username,
    required this.email,
    required this.password,
    this.displayName,
    this.imagePath,
    List<String>? follower,
    List<String>? following,
    this.measurements,
    this.type,
    this.address,
    this.style,
    this.favoriteColors,
    this.biography,
  })  : follower = follower ?? <String>[],
        following = following ?? <String>[];
}

class UserDB {
  final List<User> _users = [
    User(username: 'Eric Beck', email: 'eric@hawaii.edu', password: 'ericPass'),
    User(
        username: 'Michael Smith ',
        email: 'michael@hawaii.edu',
        password: 'michaelPass'),
    User(username: 'test', email: 'test@hawaii.edu', password: 'testPass')
  ];

  User getUser(String username) {
    return _users.firstWhere((user) => user.username == username);
  }

  void userAdd(User newUser) {
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
}
UserDB userDB = UserDB();
