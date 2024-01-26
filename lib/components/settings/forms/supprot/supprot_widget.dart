import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'supprot_model.dart';

export 'supprot_model.dart';

class SupprotWidget extends StatefulWidget {
  const SupprotWidget({super.key});

  @override
  State<SupprotWidget> createState() => _SupprotWidgetState();
}

class _SupprotWidgetState extends State<SupprotWidget> {
  late SupprotModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupprotModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.6,
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x33000000),
              offset: Offset(0.0, -2.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Support',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                child: Text(
                  'Thank you for using Password Armour',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Email : ',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: 'ashimsaha2311@gmail.com',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            logFirebaseEvent(
                                'SUPPROT_RichTextSpan_16enm3hd_ON_TAP');
                            logFirebaseEvent('RichTextSpan_send_email');
                            await launchUrl(Uri(
                                scheme: 'mailto',
                                path: 'ashimsaha2311@gmail.com',
                                query: {
                                  'subject': 'PASSWORD ARMOUR SUPPORT',
                                }
                                    .entries
                                    .map((MapEntry<String, String> e) =>
                                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                    .join('&')));
                          },
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  textScaler:
                      TextScaler.linear(MediaQuery.of(context).textScaleFactor),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 16.0, 16.0, 44.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('SUPPROT_COMP_NoteUpdateButton_ON_TAP');
                    logFirebaseEvent('NoteUpdateButton_navigate_back');
                    context.safePop();
                  },
                  text: 'Close',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
