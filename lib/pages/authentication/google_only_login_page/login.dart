import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indidus_password_manager/auth/firebase_auth/auth_util.dart';
import 'package:indidus_password_manager/flutter_flow/flutter_flow_util.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.65,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.surface,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.surface,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Indidus Password Manager',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Never forget a password again.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            const ContinueWIthGoogle(),
            const SizedBox(height: 20),
            Text(
              "Connect with us",
              style: GoogleFonts.ubuntu(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContinueWIthGoogle extends StatefulWidget {
  const ContinueWIthGoogle({super.key});

  @override
  State<ContinueWIthGoogle> createState() => _ContinueWIthGoogle();
}

class _ContinueWIthGoogle extends State<ContinueWIthGoogle> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading
          ? null
          : () async {
              setState(() => isLoading = true);
              logFirebaseEvent('CONTINUE_WITH_GOOGLE_CONTINUE_WITH_GOOGL');
              logFirebaseEvent('Button_auth');
              GoRouter.of(context).prepareAuthEvent();
              final user = await authManager.signInWithGoogle(context);
              if (user == null) {
                return;
              }

              context.goNamedAuth('LoginsPage', context.mounted);

              setState(() => isLoading = false);
            },
      icon: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(),
            )
          : SvgPicture.asset(
              'assets/images/google.svg',
              width: 24,
              height: 24,
            ),
      label: isLoading
          ? const Text("Loading...")
          : const Text(
              'Continue with Google',
              style: TextStyle(fontSize: 16),
            ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.9,
      size.width * 0.5,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.8, size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.08);
    path.cubicTo(
      size.width / 4,
      size.height,
      3 * size.width / 4,
      size.height / 2,
      size.width,
      size.height * 1,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
