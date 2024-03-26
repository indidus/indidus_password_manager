// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginImpl _$$LoginImplFromJson(Map<String, dynamic> json) => _$LoginImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      name: json['name'] as String,
      note: json['note'] as String?,
      username: json['username'] as String,
      url: json['url'] as String?,
      password: json['password'] as String?,
      passwordHint: json['passwordHint'] as String?,
    );

Map<String, dynamic> _$$LoginImplToJson(_$LoginImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'name': instance.name,
      'note': instance.note,
      'username': instance.username,
      'url': instance.url,
      'password': instance.password,
      'passwordHint': instance.passwordHint,
    };
