import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:indidus_password_manager/src/rust/models/notes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Necessary for code-generation to work
part 'note_provider.g.dart';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
@riverpod
Future<List<Note>> getAllNotes(GetAllNotesRef ref) async {
  final dio = Dio();
  final response = await dio.get(
    'https://6602ae4e9d7276a75553ef6d.mockapi.io/users',
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch data');
  }

  if (response.data == null) {
    return [];
  }

  if (response.data is List) {
    return (response.data as List)
        .map((e) => Note.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  return (jsonDecode(response.data.toString()) as List<Map<String, dynamic>>)
      .map((e) => Note.fromJson(e))
      .toList();
}

@riverpod
Future<Note?> selectNote(SelectNoteRef ref, String? id) async {
  if (id == null) {
    return null;
  }
  final dio = Dio();
  final response = await dio.get(
    'https://6602ae4e9d7276a75553ef6d.mockapi.io/users/$id',
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch data');
  }

  if (response.data == null) {
    return null;
  }

  if (response.data is Map) {
    return Note.fromJson(response.data as Map<String, dynamic>);
  }

  return null;
}

@riverpod
Future<String> createNote(CreateNoteRef ref, Note note) async {
  final dio = Dio();
  final response = await dio.post(
    'https://6602ae4e9d7276a75553ef6d.mockapi.io/users',
    data: note.toJson(),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch data');
  }

  return response.data as String;
}

@riverpod
Future<String> updateNote(UpdateNoteRef ref, Note note) async {
  final dio = Dio();
  final response = await dio.put(
    'https://6602ae4e9d7276a75553ef6d.mockapi.io/users/${note.id}',
    data: note.toJson(),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch data');
  }

  return response.data as String;
}

@riverpod
Future<String> deleteNote(DeleteNoteRef ref, String id) async {
  final dio = Dio();
  final response = await dio.delete(
    'https://6602ae4e9d7276a75553ef6d.mockapi.io/users/$id',
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch data');
  }

  return response.data as String;
}

@riverpod
class ViewNote extends _$ViewNote {
  @override
  String? build() {
    return null;
  }

  void set(String? id) {
    state = id;
  }
}
