import 'dart:convert';

import 'package:indidus_password_manager/src/rust/models/financial_cards.dart';
import 'package:indidus_password_manager/src/rust/models/identity_cards.dart';
import 'package:indidus_password_manager/src/rust/models/logins.dart';
import 'package:indidus_password_manager/src/rust/models/notes.dart';

import './model_extension/finaicial_card_extension.dart';
import './model_extension/login_extension.dart';
import './model_extension/note_extension.dart';
import 'model_extension/identity_card_extension.dart';

class Models {
  static const _jsonEncode = JsonCodec();
  final List<FinancialCard> cards;
  final List<Note> notes;
  final List<Login> logins;
  final List<IdentityCard> ids;

  const Models({
    required this.logins,
    required this.ids,
    required this.cards,
    required this.notes,
  });

  toJson() {
    return _jsonEncode.encode({
      'cards': cards.map((e) => e.toJson()).toList(),
      'notes': notes.map((e) => e.toJson()).toList(),
      'logins': logins.map((e) => e.toJson()).toList(),
      'ids': ids.map((e) => e.toJson()).toList(),
    });
  }

  factory Models.fromJson(String str) {
    Map<String, dynamic> json = _jsonEncode.decode(str);
    return Models(
      cards: json['cards'] != null
          ? List<FinancialCard>.from(
              (json['cards']).map((e) => financialCardFromJson(e)).toList())
          : [],
      notes: json['notes'] != null
          ? List<Note>.from(
              (json['notes']).map((e) => noteFromJson(e)).toList())
          : [],
      logins: json['logins'] != null
          ? List<Login>.from(
              (json['logins']).map((e) => loginFromJson(e)).toList())
          : [],
      ids: json['ids'] != null
          ? List<IdentityCard>.from(
              (json['ids']).map((e) => identityCardFromJson(e)).toList())
          : [],
    );
  }

  // Write deep equality for the model
  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    (other as Models);
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            cards.length == other.cards.length &&
            cards.every((e) => other.cards.contains(e)) &&
            notes.length == other.notes.length &&
            notes.every((e) => other.notes.contains(e)) &&
            logins.length == other.logins.length &&
            logins.every((e) => other.logins.contains(e)) &&
            ids.length == other.ids.length &&
            ids.every((e) => other.ids.contains(e));
  }

  @override
  int get hashCode =>
      cards.hashCode ^ notes.hashCode ^ logins.hashCode ^ ids.hashCode;
}
