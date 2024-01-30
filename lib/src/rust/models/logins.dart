// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.22.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

class Login {
  final String? id;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final String name;
  final String? note;
  final String username;
  final String? url;
  final String? password;
  final String? passwordHint;

  const Login({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    required this.name,
    this.note,
    required this.username,
    this.url,
    this.password,
    this.passwordHint,
  });

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      createdBy.hashCode ^
      updatedAt.hashCode ^
      updatedBy.hashCode ^
      name.hashCode ^
      note.hashCode ^
      username.hashCode ^
      url.hashCode ^
      password.hashCode ^
      passwordHint.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Login &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          createdBy == other.createdBy &&
          updatedAt == other.updatedAt &&
          updatedBy == other.updatedBy &&
          name == other.name &&
          note == other.note &&
          username == other.username &&
          url == other.url &&
          password == other.password &&
          passwordHint == other.passwordHint;
}
