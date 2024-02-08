// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.22.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'models/financial_cards.dart';
import 'models/identity_cards.dart';
import 'models/logins.dart';
import 'models/notes.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  DateTime dco_decode_Chrono_Naive(dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  DateTime dco_decode_box_autoadd_Chrono_Naive(dynamic raw);

  @protected
  FinancialCard dco_decode_box_autoadd_financial_card(dynamic raw);

  @protected
  IdentityCard dco_decode_box_autoadd_identity_card(dynamic raw);

  @protected
  Login dco_decode_box_autoadd_login(dynamic raw);

  @protected
  Note dco_decode_box_autoadd_note(dynamic raw);

  @protected
  FinancialCard dco_decode_financial_card(dynamic raw);

  @protected
  int dco_decode_i_64(dynamic raw);

  @protected
  IdentityCard dco_decode_identity_card(dynamic raw);

  @protected
  List<FinancialCard> dco_decode_list_financial_card(dynamic raw);

  @protected
  List<IdentityCard> dco_decode_list_identity_card(dynamic raw);

  @protected
  List<Login> dco_decode_list_login(dynamic raw);

  @protected
  List<Note> dco_decode_list_note(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  Login dco_decode_login(dynamic raw);

  @protected
  Note dco_decode_note(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  DateTime? dco_decode_opt_box_autoadd_Chrono_Naive(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  DateTime sse_decode_Chrono_Naive(SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  DateTime sse_decode_box_autoadd_Chrono_Naive(SseDeserializer deserializer);

  @protected
  FinancialCard sse_decode_box_autoadd_financial_card(
      SseDeserializer deserializer);

  @protected
  IdentityCard sse_decode_box_autoadd_identity_card(
      SseDeserializer deserializer);

  @protected
  Login sse_decode_box_autoadd_login(SseDeserializer deserializer);

  @protected
  Note sse_decode_box_autoadd_note(SseDeserializer deserializer);

  @protected
  FinancialCard sse_decode_financial_card(SseDeserializer deserializer);

  @protected
  int sse_decode_i_64(SseDeserializer deserializer);

  @protected
  IdentityCard sse_decode_identity_card(SseDeserializer deserializer);

  @protected
  List<FinancialCard> sse_decode_list_financial_card(
      SseDeserializer deserializer);

  @protected
  List<IdentityCard> sse_decode_list_identity_card(
      SseDeserializer deserializer);

  @protected
  List<Login> sse_decode_list_login(SseDeserializer deserializer);

  @protected
  List<Note> sse_decode_list_note(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  Login sse_decode_login(SseDeserializer deserializer);

  @protected
  Note sse_decode_note(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  DateTime? sse_decode_opt_box_autoadd_Chrono_Naive(
      SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void sse_encode_Chrono_Naive(DateTime self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_Chrono_Naive(
      DateTime self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_financial_card(
      FinancialCard self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_identity_card(
      IdentityCard self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_login(Login self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_note(Note self, SseSerializer serializer);

  @protected
  void sse_encode_financial_card(FinancialCard self, SseSerializer serializer);

  @protected
  void sse_encode_i_64(int self, SseSerializer serializer);

  @protected
  void sse_encode_identity_card(IdentityCard self, SseSerializer serializer);

  @protected
  void sse_encode_list_financial_card(
      List<FinancialCard> self, SseSerializer serializer);

  @protected
  void sse_encode_list_identity_card(
      List<IdentityCard> self, SseSerializer serializer);

  @protected
  void sse_encode_list_login(List<Login> self, SseSerializer serializer);

  @protected
  void sse_encode_list_note(List<Note> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_login(Login self, SseSerializer serializer);

  @protected
  void sse_encode_note(Note self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_Chrono_Naive(
      DateTime? self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;
}
