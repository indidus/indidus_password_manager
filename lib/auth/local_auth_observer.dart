import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

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
        if (!isAuthRequired) {
          return;
        }
        final LocalAuthentication auth = LocalAuthentication();
        bool authenticated = false;
        try {
          authenticated = await auth.authenticate(
            localizedReason:
                'For your data to be safe we have to verify it is you.',
            options: const AuthenticationOptions(
              stickyAuth: false,
              sensitiveTransaction: true,
              useErrorDialogs: true,
              biometricOnly: false,
            ),
          );
          if (authenticated) {
            isAuthRequired = false;
          }
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
        isAuthRequired = false;
        break;
    }
  }
}
