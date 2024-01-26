import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'continue_with_google_model.dart';

export 'continue_with_google_model.dart';

class ContinueWithGoogleWidget extends StatefulWidget {
  const ContinueWithGoogleWidget({super.key});

  @override
  State<ContinueWithGoogleWidget> createState() =>
      _ContinueWithGoogleWidgetState();
}

class _ContinueWithGoogleWidgetState extends State<ContinueWithGoogleWidget> {
  late ContinueWithGoogleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContinueWithGoogleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 204.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 10.0, 0.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/images/google.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CONTINUE_WITH_GOOGLE_CONTINUE_WITH_GOOGL');
                  logFirebaseEvent('Button_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  final user = await authManager.signInWithGoogle(context);
                  if (user == null) {
                    return;
                  }

                  context.goNamedAuth('LoginsPage', context.mounted);
                },
                text: 'Continue with Google',
                options: FFButtonOptions(
                  width: 143.0,
                  height: 40.0,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
