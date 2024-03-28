// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:indidus_password_manager/auth/local_auth_observer.dart';
import 'package:indidus_password_manager/responsive_app.dart';

// import 'package:indidus_password_manager/init_const.dart';
// import 'package:indidus_password_manager/src/lib/storage.dart';
// import 'package:indidus_password_manager/src/rust/frb_generated.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:sqflite/sqflite.dart';

import 'auth/firebase_auth/auth_util.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
// import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
// import 'src/rust/api/simple.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // PackageInfo packageInfo = await PackageInfo.fromPlatform();

  // appName = packageInfo.appName;
  // appVersion = packageInfo.version;
  // packageName = packageInfo.packageName;
  // buildNumber = packageInfo.buildNumber;

  // // final observer = AppLifecycle();
  // // WidgetsBinding.instance.addObserver(observer);

  // usePathUrlStrategy();
  // await initFirebase();
  // await SecureStorage.init();
  // await RustLib.init();

  // final String databasesPath = await getDatabasesPath();
  // await init(dbPath: '$databasesPath/password.db');

  // if (!kIsWeb) {
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // }

  runApp(const RiverpodApp());
}

Future<void> Function()? asyncFuncVar;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;
  ThemeData theme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightGreenAccent,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: MaterialStateProperty.all(false),
      trackVisibility: MaterialStateProperty.all(false),
      interactive: false,
    ),
  );

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    asyncFuncVar = () async {
      setState(() {
        theme = ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          scrollbarTheme: ScrollbarThemeData(
            thumbVisibility: MaterialStateProperty.all(false),
            trackVisibility: MaterialStateProperty.all(false),
            interactive: false,
          ),
        );
      });
    };

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = indidusPasswordManagerFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IndidusPasswordManager',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
      ],
      theme: theme,
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'LoginsPage';
  late Widget? _currentPage;
  var observer = LocalAuthObserver();

  @override
  void initState() {
    super.initState();
    // Ensure local authentication is required when the app is resumed
    WidgetsBinding.instance.addObserver(observer);
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(observer);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'LoginsPage': const LoginsPageWidget(),
      'FinancialCardsPage': const FinancialCardsPageWidget(),
      'IdentityCardsPage': const IdentityCardsPageWidget(),
      'NotesPage': const NotesPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail_outlined,
              size: 24.0,
            ),
            label: 'Logins',
            tooltip: '',
            activeIcon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_outlined,
              size: 24.0,
            ),
            label: 'Cards',
            tooltip: '',
            activeIcon: Icon(Icons.account_balance),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 24.0,
            ),
            label: 'Identity',
            tooltip: '',
            activeIcon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note_alt_outlined,
              size: 24.0,
            ),
            label: 'Notes',
            tooltip: '',
            activeIcon: Icon(Icons.note_alt),
          )
        ],
      ),
    );
  }
}

// class LocalAuthObserver extends WidgetsBindingObserver {
//   final AsyncCallback? resumeCallBack;
//   final AsyncCallback? suspendingCallBack;
//   bool isAuthRequired = false;

//   LocalAuthObserver({
//     this.resumeCallBack,
//     this.suspendingCallBack,
//   });

//   @override
//   Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//     print("state changed ${state.name}");
//     switch (state) {
//       case AppLifecycleState.resumed:
//         if (!isAuthRequired) {
//           return;
//         }
//         final LocalAuthentication auth = LocalAuthentication();
//         bool authenticated = false;
//         try {
//           authenticated = await auth.authenticate(
//             localizedReason: 'For your data to be we have to verify it is you.',
//             options: const AuthenticationOptions(
//               stickyAuth: false,
//               sensitiveTransaction: true,
//               useErrorDialogs: true,
//               biometricOnly: false,
//             ),
//           );
//           if (authenticated) {
//             isAuthRequired = false;
//           }
//         } catch (e) {
//           if (kDebugMode) {
//             print("error using biometric auth: $e");
//           }
//         }
//         break;
//       case AppLifecycleState.inactive:
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//       case AppLifecycleState.hidden:
//         isAuthRequired = true;
//         break;
//     }
//   }
// }
