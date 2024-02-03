import 'dart:typed_data';

import 'package:key_store_plugin/key_store_plugin.dart';

class SecureStorage {
  static final KeyStore _plugin = KeyStore();

  // Make it singleton
  SecureStorage._();

  static Future<void> init() async {
    bool isSet = await _plugin.isKeySet();
    if (!isSet) {
      await _plugin.storeKey();
    }
  }

  static Future<String?> encrypt(String data) async {
    var eData = await _plugin.encryptData(data);
    if (eData == null) {
      return null;
    }
    return String.fromCharCodes(eData);
  }

  static Future<String?> decrypt(String eData) async {
    Uint8List e = Uint8List.fromList(eData.codeUnits);
    return await _plugin.decryptData(e);
  }
}
