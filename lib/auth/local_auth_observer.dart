import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class AuthManagerStorage {
  static final AuthManagerStorage _instance = AuthManagerStorage._();
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      sharedPreferencesName: 'IndidusAuthManager',
      resetOnError: false,
    ),
  );
  factory AuthManagerStorage() {
    return _instance;
  }

  AuthManagerStorage._();

  static AuthManagerStorage get instance => _instance;

  Future<bool> setAuthRequired(bool isAuthRequired) async {
    try {
      await _storage.write(
        key: 'isAuthRequired',
        value: isAuthRequired.toString(),
      );
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("error setting auth required: $e");
      }
      return false;
    }
  }

  Future<bool> isAuthRequired() async {
    try {
      var value = await _storage.read(
        key: 'isAuthRequired',
      );
      if (value == null) {
        // Key is not set, may be first time user
        return false;
      }
      return bool.parse(value, caseSensitive: false);
    } catch (e) {
      if (kDebugMode) {
        print("error setting auth required: $e");
      }
      return true;
    }
  }
}

class LocalAuthObserver extends WidgetsBindingObserver {
  bool isAuthRequired = false;

  LocalAuthObserver();

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (kDebugMode) {
      print("state changed ${state.name}");
    }
    switch (state) {
      case AppLifecycleState.resumed:
        isAuthRequired = await AuthManagerStorage.instance.isAuthRequired();
        if (!isAuthRequired) {
          return;
        }
        final LocalAuthentication auth = LocalAuthentication();
        bool authenticated = false;
        try {
          authenticated = await auth.authenticate(
            localizedReason: 'For safety we have to verify it is you.',
            options: const AuthenticationOptions(
              stickyAuth: false,
              sensitiveTransaction: true,
              useErrorDialogs: true,
              biometricOnly: false,
            ),
          );
          await AuthManagerStorage.instance.setAuthRequired(!authenticated);
        } catch (e) {
          if (kDebugMode) {
            print("error using biometric auth: $e");
          }
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        isAuthRequired =
            await AuthManagerStorage.instance.setAuthRequired(true);
        break;
    }
  }
}
