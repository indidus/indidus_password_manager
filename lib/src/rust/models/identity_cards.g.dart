// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentityCardImpl _$$IdentityCardImplFromJson(Map<String, dynamic> json) =>
    _$IdentityCardImpl(
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
      country: json['country'] as String?,
      expiryDate: json['expiryDate'] as String?,
      identityCardNumber: json['identityCardNumber'] as String,
      identityCardType: json['identityCardType'] as String?,
      issueDate: json['issueDate'] as String?,
      nameOnCard: json['nameOnCard'] as String,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$IdentityCardImplToJson(_$IdentityCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'name': instance.name,
      'note': instance.note,
      'country': instance.country,
      'expiryDate': instance.expiryDate,
      'identityCardNumber': instance.identityCardNumber,
      'identityCardType': instance.identityCardType,
      'issueDate': instance.issueDate,
      'nameOnCard': instance.nameOnCard,
      'state': instance.state,
    };
