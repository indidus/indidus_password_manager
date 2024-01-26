import '../database.dart';

class FinancialCardsTable extends SupabaseTable<FinancialCardsRow> {
  @override
  String get tableName => 'financial_cards';

  @override
  FinancialCardsRow createRow(Map<String, dynamic> data) =>
      FinancialCardsRow(data);
}

class FinancialCardsRow extends SupabaseDataRow {
  FinancialCardsRow(super.data);

  @override
  SupabaseTable get table => FinancialCardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  String get cardHolderName => getField<String>('card_holder_name')!;
  set cardHolderName(String value) =>
      setField<String>('card_holder_name', value);

  String get cardNumber => getField<String>('card_number')!;
  set cardNumber(String value) => setField<String>('card_number', value);

  String? get cardProviderName => getField<String>('card_provider_name');
  set cardProviderName(String? value) =>
      setField<String>('card_provider_name', value);

  String? get cardType => getField<String>('card_type');
  set cardType(String? value) => setField<String>('card_type', value);

  String? get cvv => getField<String>('cvv');
  set cvv(String? value) => setField<String>('cvv', value);

  String? get expiryDate => getField<String>('expiry_date');
  set expiryDate(String? value) => setField<String>('expiry_date', value);

  String? get issueDate => getField<String>('issue_date');
  set issueDate(String? value) => setField<String>('issue_date', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get pin => getField<String>('pin');
  set pin(String? value) => setField<String>('pin', value);
}
