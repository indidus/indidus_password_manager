// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.28.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

class Note {
  final String? id;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final String name;
  final String? note;

  const Note({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    required this.name,
    this.note,
  });

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      createdBy.hashCode ^
      updatedAt.hashCode ^
      updatedBy.hashCode ^
      name.hashCode ^
      note.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          createdBy == other.createdBy &&
          updatedAt == other.updatedAt &&
          updatedBy == other.updatedBy &&
          name == other.name &&
          note == other.note;
}
