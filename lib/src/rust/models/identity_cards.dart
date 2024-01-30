// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.22.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

class IdentityCard {
  final String? id;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final String name;
  final String? note;
  final String? country;
  final String? expiryDate;
  final String identityCardNumber;
  final String? identityCardType;
  final String? issueDate;
  final String nameOnCard;
  final String? state;

  const IdentityCard({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    required this.name,
    this.note,
    this.country,
    this.expiryDate,
    required this.identityCardNumber,
    this.identityCardType,
    this.issueDate,
    required this.nameOnCard,
    this.state,
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
      country.hashCode ^
      expiryDate.hashCode ^
      identityCardNumber.hashCode ^
      identityCardType.hashCode ^
      issueDate.hashCode ^
      nameOnCard.hashCode ^
      state.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentityCard &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          createdBy == other.createdBy &&
          updatedAt == other.updatedAt &&
          updatedBy == other.updatedBy &&
          name == other.name &&
          note == other.note &&
          country == other.country &&
          expiryDate == other.expiryDate &&
          identityCardNumber == other.identityCardNumber &&
          identityCardType == other.identityCardType &&
          issueDate == other.issueDate &&
          nameOnCard == other.nameOnCard &&
          state == other.state;
}
