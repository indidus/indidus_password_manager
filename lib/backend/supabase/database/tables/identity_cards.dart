import '../database.dart';

class IdentityCardsTable extends SupabaseTable<IdentityCardsRow> {
  @override
  String get tableName => 'identity_cards';

  @override
  IdentityCardsRow createRow(Map<String, dynamic> data) =>
      IdentityCardsRow(data);
}

class IdentityCardsRow extends SupabaseDataRow {
  IdentityCardsRow(super.data);

  @override
  SupabaseTable get table => IdentityCardsTable();

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

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  String? get expiryDate => getField<String>('expiry_date');
  set expiryDate(String? value) => setField<String>('expiry_date', value);

  String get identityCardNumber => getField<String>('identity_card_number')!;
  set identityCardNumber(String value) =>
      setField<String>('identity_card_number', value);

  String? get identityCardType => getField<String>('identity_card_type');
  set identityCardType(String? value) =>
      setField<String>('identity_card_type', value);

  String? get issueDate => getField<String>('issue_date');
  set issueDate(String? value) => setField<String>('issue_date', value);

  String get nameOnCard => getField<String>('name_on_card')!;
  set nameOnCard(String value) => setField<String>('name_on_card', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);
}
