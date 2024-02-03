import 'package:flutter_test/flutter_test.dart';
import 'package:indidus_password_manager/src/lib/storage.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('SecureStorage', () {
    setUpAll(() async {
      await SecureStorage.init();
    });

    test('decrypt', () async {
      const encryptedData = 'encrypted data';
      final decryptedData = await SecureStorage.decrypt(encryptedData);
      expect(decryptedData, 'original data');
    });
  });
}
