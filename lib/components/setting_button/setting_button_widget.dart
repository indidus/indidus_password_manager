import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'setting_button_model.dart';
export 'setting_button_model.dart';

class SettingButtonWidget extends StatefulWidget {
  const SettingButtonWidget({super.key});

  @override
  _SettingButtonWidgetState createState() => _SettingButtonWidgetState();
}

class _SettingButtonWidgetState extends State<SettingButtonWidget> {
  late SettingButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
      child: FlutterFlowIconButton(
        borderRadius: 20.0,
        borderWidth: 1.0,
        buttonSize: 40.0,
        icon: Icon(
          Icons.settings_sharp,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        onPressed: () async {
          logFirebaseEvent('SETTING_BUTTON_settings_sharp_ICN_ON_TAP');
          logFirebaseEvent('IconButton_navigate_to');

          context.goNamed('Setting');
        },
      ),
    );
  }
}
