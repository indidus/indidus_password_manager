import '../database.dart';

class LoginsTable extends SupabaseTable<LoginsRow> {
  @override
  String get tableName => 'logins';

  @override
  LoginsRow createRow(Map<String, dynamic> data) => LoginsRow(data);
}

class LoginsRow extends SupabaseDataRow {
  LoginsRow(super.data);

  @override
  SupabaseTable get table => LoginsTable();

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

  String get username => getField<String>('username')!;
  set username(String value) => setField<String>('username', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get passwordHint => getField<String>('password_hint');
  set passwordHint(String? value) => setField<String>('password_hint', value);
}
