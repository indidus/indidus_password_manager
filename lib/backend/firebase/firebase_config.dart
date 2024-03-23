import 'package:firebase_core/firebase_core.dart';
import 'package:indidus_password_manager/firebase_options.dart';

Future initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
