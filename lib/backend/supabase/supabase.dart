import 'package:supabase_flutter/supabase_flutter.dart';

export 'database/database.dart';

const _kSupabaseUrl = 'https://awxapuvrqpgoszfbneql.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3eGFwdXZycXBnb3N6ZmJuZXFsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ2MDc5MzEsImV4cCI6MjAyMDE4MzkzMX0.EoOXZhjrtZS01-IemrlrNXmxjWeXrjqOBiUXE5U_fNI';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
