import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/src/rust/models/identity_cards.dart';
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
        decoration: getModalBottomSheetBoxDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomSheetUpperBar(),
            const ModalBottomSheetHeaderText(level: "Save Indentity Card"),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.nameFieldController,
                          focusNode: _model.nameFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Name",
                          ),
                          validator: _model.nameFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.nameOnCardFieldController,
                          focusNode: _model.nameOnCardFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Name on card",
                          ),
                          validator: _model.nameOnCardFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.cardNumberFieldController,
                          focusNode: _model.cardNumberFieldFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Card Number",
                          ),
                          validator: _model.cardNumberFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.countryFieldController,
                          focusNode: _model.countryFieldFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Country",
                          ),
                          validator: _model.countryFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.stateFieldController,
                          focusNode: _model.stateFieldFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "State / provision",
                          ),
                          validator: _model.stateFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
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
                          width: 3000.0,
                          height: 60.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Please select card type...',
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24.0,
                          ),
                          fillColor: Theme.of(context).colorScheme.surface,
                          elevation: 0.0,
                          borderColor: Theme.of(context).colorScheme.outline,
                          borderWidth: 1.5,
                          borderRadius: 4.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.issueDateFieldController,
                          focusNode: _model.issueDateFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Card issued on",
                          ),
                          keyboardType: TextInputType.number,
                          validator: _model.issueDateFieldControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.issueDateFieldMask],
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.expireDateFieldController,
                          focusNode: _model.expireDateFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Card expired on",
                          ),
                          keyboardType: TextInputType.multiline,
                          validator: _model.expireDateFieldControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.expireDateFieldMask],
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.noteFieldController,
                          focusNode: _model.noteFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Note",
                          ),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          validator: _model.noteFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            Container(
              padding: getModalBottomSheetFooterPadding(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  FilledButton(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CREATE_IDENTITY_CARD_IdentityCardCreateB');
                      logFirebaseEvent('IdentityCardCreateButton_backend_call');

                      await postIdentityCard(
                        data: IdentityCard(
                          createdAt: getCurrentTimestamp,
                          createdBy: currentUserUid,
                          name: _model.nameFieldController.text,
                          note: _model.noteFieldController.text,
                          country: _model.countryFieldController.text,
                          expiryDate: _model.expireDateFieldController.text,
                          identityCardNumber:
                              _model.cardNumberFieldController.text,
                          identityCardType: _model.cardTypeFieldValue,
                          issueDate: _model.issueDateFieldController.text,
                          nameOnCard: _model.nameOnCardFieldController.text,
                          state: _model.stateFieldController.text,
                        ),
                      );
                      logFirebaseEvent(
                          'IdentityCardCreateButton_close_dialog,_d');
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
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
