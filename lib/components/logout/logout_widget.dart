import 'package:flutter/material.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'logout_model.dart';

export 'logout_model.dart';

class LogoutWidget extends StatefulWidget {
  const LogoutWidget({super.key});

  @override
  State<LogoutWidget> createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  late LogoutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoutModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.logout_sharp,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      onPressed: () async {
        logFirebaseEvent('LOGOUT_COMP_logout_sharp_ICN_ON_TAP');
        logFirebaseEvent('IconButton_auth');
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        logFirebaseEvent('IconButton_navigate_to');

        context.goNamedAuth('GoogleOnlyLoginPage', context.mounted);
      },
    );
  }
}
