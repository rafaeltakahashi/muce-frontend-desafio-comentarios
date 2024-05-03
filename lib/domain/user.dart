import 'dart:ui';

/// Reference to a user.
/// This does not contain any personal information or authentication data
/// for the user. It's a reference to be used in other classes that need to
/// point to a user.
class UserReference {
  const UserReference({
    required this.username,
    required this.email,
    required this.usernameColor,
  });
  final String username;
  final String email;
  final Color? usernameColor;
}

// A different class would be used to represent a user with
// authentication data.
