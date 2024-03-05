// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.26.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../models/financial_cards.dart';
import '../models/identity_cards.dart';
import '../models/logins.dart';
import '../models/notes.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

String greet({required String name, dynamic hint}) =>
    RustLib.instance.api.greet(name: name, hint: hint);

Future<bool> init({required String dbPath, dynamic hint}) =>
    RustLib.instance.api.init(dbPath: dbPath, hint: hint);

Future<Login> getLogin({required String id, dynamic hint}) =>
    RustLib.instance.api.getLogin(id: id, hint: hint);

Future<Login> postLogin({required Login data, dynamic hint}) =>
    RustLib.instance.api.postLogin(data: data, hint: hint);

Future<Login> putLogin(
        {required String id, required Login data, dynamic hint}) =>
    RustLib.instance.api.putLogin(id: id, data: data, hint: hint);

Future<Login> deleteLogin({required String id, dynamic hint}) =>
    RustLib.instance.api.deleteLogin(id: id, hint: hint);

Future<List<Login>> listLogin({required String query, dynamic hint}) =>
    RustLib.instance.api.listLogin(query: query, hint: hint);

Future<FinancialCard> getFinancialCard({required String id, dynamic hint}) =>
    RustLib.instance.api.getFinancialCard(id: id, hint: hint);

Future<FinancialCard> postFinancialCard(
        {required FinancialCard data, dynamic hint}) =>
    RustLib.instance.api.postFinancialCard(data: data, hint: hint);

Future<FinancialCard> putFinancialCard(
        {required String id, required FinancialCard data, dynamic hint}) =>
    RustLib.instance.api.putFinancialCard(id: id, data: data, hint: hint);

Future<FinancialCard> deleteFinancialCard({required String id, dynamic hint}) =>
    RustLib.instance.api.deleteFinancialCard(id: id, hint: hint);

Future<List<FinancialCard>> listFinancialCard(
        {required String query, dynamic hint}) =>
    RustLib.instance.api.listFinancialCard(query: query, hint: hint);

Future<IdentityCard> getIdentityCard({required String id, dynamic hint}) =>
    RustLib.instance.api.getIdentityCard(id: id, hint: hint);

Future<IdentityCard> postIdentityCard(
        {required IdentityCard data, dynamic hint}) =>
    RustLib.instance.api.postIdentityCard(data: data, hint: hint);

Future<IdentityCard> putIdentityCard(
        {required String id, required IdentityCard data, dynamic hint}) =>
    RustLib.instance.api.putIdentityCard(id: id, data: data, hint: hint);

Future<IdentityCard> deleteIdentityCard({required String id, dynamic hint}) =>
    RustLib.instance.api.deleteIdentityCard(id: id, hint: hint);

Future<List<IdentityCard>> listIdentityCard(
        {required String query, dynamic hint}) =>
    RustLib.instance.api.listIdentityCard(query: query, hint: hint);

Future<Note> getNote({required String id, dynamic hint}) =>
    RustLib.instance.api.getNote(id: id, hint: hint);

Future<Note> postNote({required Note data, dynamic hint}) =>
    RustLib.instance.api.postNote(data: data, hint: hint);

Future<Note> putNote({required String id, required Note data, dynamic hint}) =>
    RustLib.instance.api.putNote(id: id, data: data, hint: hint);

Future<Note> deleteNote({required String id, dynamic hint}) =>
    RustLib.instance.api.deleteNote(id: id, hint: hint);

Future<List<Note>> listNote({required String query, dynamic hint}) =>
    RustLib.instance.api.listNote(query: query, hint: hint);
