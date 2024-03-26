

// identityCardFromJson(Map<String, dynamic> json) => IdentityCard(
//       id: json['id'] as String?,
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'] as String)
//           : null,
//       createdBy: json['created_by'] as String?,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'] as String)
//           : null,
//       updatedBy: json['updated_by'] as String?,
//       name: json['name'] as String,
//       note: json['note'] as String?,
//       country: json['country'] as String?,
//       expiryDate: json['expiry_date'] as String?,
//       identityCardNumber: json['identity_card_number'] as String,
//       identityCardType: json['identity_card_type'] as String?,
//       issueDate: json['issue_date'] as String?,
//       nameOnCard: json['name_on_card'] as String,
//       state: json['state'] as String?,
//     );

// extension IdentityCardJson on IdentityCard {
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'created_at': createdAt?.toIso8601String(),
//       'created_by': createdBy,
//       'updated_at': updatedAt?.toIso8601String(),
//       'updated_by': updatedBy,
//       'name': name,
//       'note': note,
//       'country': country,
//       'expiry_date': expiryDate,
//       'identity_card_number': identityCardNumber,
//       'identity_card_type': identityCardType,
//       'issue_date': issueDate,
//       'name_on_card': nameOnCard,
//       'state': state,
//     };
//   }
// }
