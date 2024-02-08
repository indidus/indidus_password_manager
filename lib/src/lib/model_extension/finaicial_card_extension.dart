import 'package:indidus_password_manager/src/rust/models/financial_cards.dart';

financialCardFromJson(Map<String, dynamic> json) => FinancialCard(
      id: json['id'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      updatedBy: json['updated_by'] as String?,
      cardHolderName: json['card_holder_name'] as String,
      cardNumber: json['card_number'] as String,
      cardProviderName: json['card_provider_name'] as String?,
      cardType: json['card_type'] as String?,
      cvv: json['cvv'] as String?,
      expiryDate: json['expiry_date'] as String?,
      issueDate: json['issue_date'] as String?,
      name: json['name'] as String,
      note: json['note'] as String?,
      pin: json['pin'] as String?,
    );

extension FinancialCardJson on FinancialCard {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'created_by': createdBy,
      'updated_at': updatedAt?.toIso8601String(),
      'updated_by': updatedBy,
      'card_holder_name': cardHolderName,
      'card_number': cardNumber,
      'card_provider_name': cardProviderName,
      'card_type': cardType,
      'cvv': cvv,
      'expiry_date': expiryDate,
      'issue_date': issueDate,
      'name': name,
      'note': note,
      'pin': pin,
    };
  }
}
