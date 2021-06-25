import 'package:flutter/material.dart';

abstract class User {
  User({
    required this.id,
    required this.username,
  });

  final UserId id;
  final String username;
}

// TODO: update dart sdk to 2.13.0 to use non-functional type alias
// typedef UserId = String;
// typedef Username = String;
// typedef UserId = String Function(String id);
// typedef UserId = String Function(String id);

// ****************************************
// * values
// ****************************************

class UserId {
  UserId(this.value) : assert(value.isNotEmpty) {
    if (value.isEmpty) {
      throw Error();
    }
  }
  final String value;
}

enum UserType {
  parent,
  child,
  invalid,
}
