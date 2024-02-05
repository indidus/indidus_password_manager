import 'package:indidus_password_manager/src/rust/models/logins.dart';

loginFromJson(Map<String, dynamic> json) => Login(
      id: json['id'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      updatedBy: json['updated_by'] as String?,
      name: json['name'] as String,
      note: json['note'] as String?,
      username: json['username'] as String,
      url: json['url'] as String?,
      password: json['password'] as String?,
      passwordHint: json['password_hint'] as String?,
    );

extension LoginJson on Login {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'created_by': createdBy,
      'updated_at': updatedAt?.toIso8601String(),
      'updated_by': updatedBy,
      'name': name,
      'note': note,
      'username': username,
      'url': url,
      'password': password,
      'password_hint': passwordHint,
    };
  }
}
