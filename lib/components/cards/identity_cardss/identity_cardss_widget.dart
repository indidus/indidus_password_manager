import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'identity_cardss_model.dart';

export 'identity_cardss_model.dart';

class IdentityCardssWidget extends StatefulWidget {
  const IdentityCardssWidget({super.key});

  @override
  State<IdentityCardssWidget> createState() => _IdentityCardssWidgetState();
}

class _IdentityCardssWidgetState extends State<IdentityCardssWidget> {
  late IdentityCardssModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IdentityCardssModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: FlutterFlowTheme.of(context).primaryText,
              offset: const Offset(0.0, 3.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 8.0, 0.0),
                    child: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 64.0,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ashim Kumar Saha',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Text(
                          '',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Text(
                          '',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
