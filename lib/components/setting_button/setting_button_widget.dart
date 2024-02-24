import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'setting_button_model.dart';

export 'setting_button_model.dart';

class SettingButtonWidget extends StatefulWidget {
  const SettingButtonWidget({super.key});

  @override
  State<SettingButtonWidget> createState() => _SettingButtonWidgetState();
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
      child: IconButton(
        icon: const Icon(
          Icons.settings_sharp,
          size: 24.0,
        ),
        onPressed: () async {
          logFirebaseEvent('SETTING_BUTTON_settings_sharp_ICN_ON_TAP');
          logFirebaseEvent('IconButton_navigate_to');

          context.pushNamed('Setting');
        },
      ),
    );
  }
}
