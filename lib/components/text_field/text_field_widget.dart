import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_model.dart';

export 'text_field_model.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.fieldName,
    required this.fieldValue,
  });

  final String? fieldName;
  final String? fieldValue;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text(
        valueOrDefault<String>(
          widget.fieldName,
          '-',
        ),
      ),
      subtitle: Text(
        valueOrDefault<String>(
          widget.fieldValue,
          '-',
        ),
      ),
      leading: const VerticalDivider(
        thickness: 5,
        color: Colors.black,
      ),
      trailing: FlutterFlowIconButton(
        borderRadius: 0.0,
        buttonSize: 40.0,
        icon: const Icon(
          Icons.content_copy,
          size: 24.0,
        ),
        onPressed: () async {
          logFirebaseEvent('TEXT_FIELD_COMP_content_copy_ICN_ON_TAP');
          logFirebaseEvent('IconButton_haptic_feedback');
          HapticFeedback.vibrate();
          logFirebaseEvent('IconButton_copy_to_clipboard');
          await Clipboard.setData(ClipboardData(text: widget.fieldValue!));
        },
      ),
    );
  }
}
