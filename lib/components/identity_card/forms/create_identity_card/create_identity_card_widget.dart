import 'package:flutter/material.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_identity_card_model.dart';

export 'create_identity_card_model.dart';

class CreateIdentityCardWidget extends StatefulWidget {
  const CreateIdentityCardWidget({super.key});

  @override
  State<CreateIdentityCardWidget> createState() =>
      _CreateIdentityCardWidgetState();
}

class _CreateIdentityCardWidgetState extends State<CreateIdentityCardWidget> {
  late CreateIdentityCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateIdentityCardModel());

    _model.nameFieldController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();

    _model.nameOnCardFieldController ??= TextEditingController();
    _model.nameOnCardFieldFocusNode ??= FocusNode();

    _model.cardNumberFieldController ??= TextEditingController();
    _model.cardNumberFieldFocusNode ??= FocusNode();

    _model.countryFieldController ??= TextEditingController();
    _model.countryFieldFocusNode ??= FocusNode();

    _model.stateFieldController ??= TextEditingController();
    _model.stateFieldFocusNode ??= FocusNode();

    _model.issueDateFieldController ??= TextEditingController();
    _model.issueDateFieldFocusNode ??= FocusNode();

    _model.expireDateFieldController ??= TextEditingController();
    _model.expireDateFieldFocusNode ??= FocusNode();

    _model.noteFieldController ??= TextEditingController();
    _model.noteFieldFocusNode ??= FocusNode();
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
            shrinkWrap: true,
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
                    const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                child: Text(
                  'Save indentity card details',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.nameFieldController,
                  focusNode: _model.nameFieldFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.nameFieldControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.nameOnCardFieldController,
                  focusNode: _model.nameOnCardFieldFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Name on card',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator: _model.nameOnCardFieldControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.cardNumberFieldController,
                  focusNode: _model.cardNumberFieldFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator: _model.cardNumberFieldControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.countryFieldController,
                  focusNode: _model.countryFieldFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator: _model.countryFieldControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.stateFieldController,
                  focusNode: _model.stateFieldFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'State / provision',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.stateFieldControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.cardTypeFieldValueController ??=
                      FormFieldController<String>(null),
                  options: List<String>.from([
                    'PASSPORT',
                    'DRIVING_LICENCE',
                    'AADHAR',
                    'PAN',
                    'RATION_CARD',
                    'SOCIAL_SECURITY_NUMBER',
                    'OTHERS'
                  ]),
                  optionLabels: const [
                    'PASSPORT',
                    'DRIVING_LICENCE',
                    'AADHAR',
                    'PAN',
                    'RATION_CARD',
                    'SOCIAL_SECURITY_NUMBER',
                    'OTHERS'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.cardTypeFieldValue = val),
                  width: 300.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  hintText: 'Please select card type...',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.issueDateFieldController,
                  focusNode: _model.issueDateFieldFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Card issued on',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator: _model.issueDateFieldControllerValidator
                      .asValidator(context),
                  inputFormatters: [_model.issueDateFieldMask],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.expireDateFieldController,
                  focusNode: _model.expireDateFieldFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Card expired on',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.multiline,
                  validator: _model.expireDateFieldControllerValidator
                      .asValidator(context),
                  inputFormatters: [_model.expireDateFieldMask],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.noteFieldController,
                  focusNode: _model.noteFieldFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Note',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.noteFieldControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 16.0, 16.0, 44.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'CREATE_IDENTITY_CARD_IdentityCardCreateB');
                    logFirebaseEvent('IdentityCardCreateButton_backend_call');
                    await IdentityCardsTable().insert({
                      'created_at':
                          supaSerialize<DateTime>(getCurrentTimestamp),
                      'created_by': currentUserUid,
                      'name': _model.nameFieldController.text,
                      'note': _model.noteFieldController.text,
                      'country': _model.countryFieldController.text,
                      'expiry_date': _model.expireDateFieldController.text,
                      'identity_card_number':
                          _model.cardNumberFieldController.text,
                      'identity_card_type': _model.cardTypeFieldValue,
                      'issue_date': _model.issueDateFieldController.text,
                      'name_on_card': _model.nameOnCardFieldController.text,
                      'state': _model.stateFieldController.text,
                    });
                    logFirebaseEvent(
                        'IdentityCardCreateButton_close_dialog,_d');
                    Navigator.pop(context);
                  },
                  text: 'Save card details',
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
