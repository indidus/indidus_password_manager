import 'package:flutter/material.dart';

import '/backend/supabase/supabase.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_login_model.dart';

export 'view_login_model.dart';

class ViewLoginWidget extends StatefulWidget {
  const ViewLoginWidget({
    super.key,
    required this.login,
  });

  final LoginsRow? login;

  @override
  State<ViewLoginWidget> createState() => _ViewLoginWidgetState();
}

class _ViewLoginWidgetState extends State<ViewLoginWidget> {
  late ViewLoginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewLoginModel());
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'View login',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.w300,
                              ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.textFieldModel1,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Name',
                  fieldValue: widget.login!.name,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel2,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Url',
                  fieldValue: widget.login!.url!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel3,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Username',
                  fieldValue: widget.login!.username,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel4,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Password',
                  fieldValue: widget.login!.password!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel5,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Password Hint',
                  fieldValue: widget.login!.passwordHint!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel6,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Note',
                  fieldValue: widget.login!.note!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
