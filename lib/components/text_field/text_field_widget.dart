import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.2),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 0.0,
              color: Color(0xFFE0E3E7),
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 4.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  borderRadius: BorderRadius.circular(0.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 0.5,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.fieldName,
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.fieldValue,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderRadius: 0.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.content_copy,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('TEXT_FIELD_COMP_content_copy_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_haptic_feedback');
                  HapticFeedback.mediumImpact();
                  logFirebaseEvent('IconButton_copy_to_clipboard');
                  await Clipboard.setData(
                      ClipboardData(text: widget.fieldValue!));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
