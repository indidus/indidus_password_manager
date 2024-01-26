import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'create_or_updated_at_model.dart';
export 'create_or_updated_at_model.dart';

class CreateOrUpdatedAtWidget extends StatefulWidget {
  const CreateOrUpdatedAtWidget({
    super.key,
    this.createdAt,
    this.updatedAt,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  _CreateOrUpdatedAtWidgetState createState() =>
      _CreateOrUpdatedAtWidgetState();
}

class _CreateOrUpdatedAtWidgetState extends State<CreateOrUpdatedAtWidget> {
  late CreateOrUpdatedAtModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateOrUpdatedAtModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.updatedAt != null)
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Updated - ${dateTimeFormat(
                      'relative',
                      widget.updatedAt,
                      locale: FFLocalizations.of(context).languageCode,
                    )}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ),
            if (widget.updatedAt == null)
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Created - ${dateTimeFormat(
                      'relative',
                      widget.createdAt,
                      locale: FFLocalizations.of(context).languageCode,
                    )}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
