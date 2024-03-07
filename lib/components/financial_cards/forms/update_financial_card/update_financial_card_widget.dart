import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/storage.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/src/rust/models/financial_cards.dart';
import 'update_financial_card_model.dart';

export 'update_financial_card_model.dart';

class UpdateFinancialCardWidget extends StatefulWidget {
  const UpdateFinancialCardWidget({
    super.key,
    required this.card,
  });

  final FinancialCard card;

  @override
  State<UpdateFinancialCardWidget> createState() =>
      _UpdateFinancialCardWidgetState();
}

class _UpdateFinancialCardWidgetState extends State<UpdateFinancialCardWidget> {
  late UpdateFinancialCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateFinancialCardModel());

    _model.cardHolderNameFieldController ??=
        TextEditingController(text: widget.card.cardHolderName);
    _model.cardHolderNameFieldFocusNode ??= FocusNode();

    _model.nameFieldController ??=
        TextEditingController(text: widget.card.name);
    _model.nameFieldFocusNode ??= FocusNode();

    _model.cardNumberFieldController ??=
        TextEditingController(text: widget.card.cardNumber);
    _model.cardNumberFieldFocusNode ??= FocusNode();

    _model.cardProviderNameFieldController ??=
        TextEditingController(text: widget.card.cardProviderName);
    _model.cardProviderNameFieldFocusNode ??= FocusNode();

    _model.pinFieldController ??= TextEditingController(text: widget.card.pin);
    _model.pinFieldFocusNode ??= FocusNode();

    _model.cvvFieldController ??= TextEditingController(text: widget.card.cvv);
    _model.cvvFieldFocusNode ??= FocusNode();

    _model.issueDateFieldController ??=
        TextEditingController(text: widget.card.issueDate);
    _model.issueDateFieldFocusNode ??= FocusNode();

    _model.expireDateFieldController ??=
        TextEditingController(text: widget.card.expiryDate);
    _model.expireDateFieldFocusNode ??= FocusNode();

    _model.noteFieldController ??=
        TextEditingController(text: widget.card.note);
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
        decoration: getModalBottomSheetBoxDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomSheetUpperBar(),
            const ModalBottomSheetHeaderText(level: "Update login"),
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
                          controller: _model.cardHolderNameFieldController,
                          focusNode: _model.cardHolderNameFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Card holder name",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model
                              .cardHolderNameFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
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
                          controller: _model.cardNumberFieldController,
                          focusNode: _model.cardNumberFieldFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Card Number",
                          ),
                          keyboardType: TextInputType.number,
                          validator: _model.cardNumberFieldControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.cardNumberFieldMask],
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.cardProviderNameFieldController,
                          focusNode: _model.cardProviderNameFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Card provider",
                          ),
                          validator: _model
                              .cardProviderNameFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.pinFieldController,
                          focusNode: _model.pinFieldFocusNode,
                          autofocus: true,
                          obscureText: !_model.pinFieldVisibility,
                          decoration: InputDecoration(
                            labelText: 'Pin',
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                                width: 2.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                                width: 2.0,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.pinFieldVisibility =
                                    !_model.pinFieldVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.pinFieldVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 24.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: _model.pinFieldControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.pinFieldMask],
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.cvvFieldController,
                          focusNode: _model.cvvFieldFocusNode,
                          autofocus: true,
                          obscureText: !_model.cvvFieldVisibility,
                          decoration: InputDecoration(
                            labelText: 'CVV',
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                                width: 2.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                                width: 2.0,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.cvvFieldVisibility =
                                    !_model.cvvFieldVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.cvvFieldVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 24.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: _model.cvvFieldControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.cvvFieldMask],
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.cardTypeFieldValueController ??=
                              FormFieldController<String>(
                            _model.cardTypeFieldValue ??= widget.card.cardType,
                          ),
                          options:
                              List<String>.from(['CREDIT', 'DEBIT', 'OTHER']),
                          optionLabels: const ['CREDIT', 'DEBIT', 'OTHER'],
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
                          validator: _model.issueDateFieldControllerValidator
                              .asValidator(context),
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
                          validator: _model.expireDateFieldControllerValidator
                              .asValidator(context),
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
                      if (_model.formKey.currentState!.validate()) {
                        logFirebaseEvent(
                            'UPDATE_FINANCIAL_CARD_FinantcialCardCrea');
                        logFirebaseEvent(
                            'FinantcialCardCreateButton_backend_call');
                        await putFinancialCard(
                          id: widget.card.id!,
                          data: FinancialCard(
                            createdAt: widget.card.createdAt,
                            createdBy: widget.card.createdBy,
                            updatedAt: getCurrentTimestamp,
                            updatedBy: currentUserUid,
                            cardHolderName:
                                _model.cardHolderNameFieldController.text,
                            cardNumber: _model.cardNumberFieldController.text,
                            cardProviderName:
                                _model.cardProviderNameFieldController.text,
                            cardType: _model.cardTypeFieldValue,
                            cvv: await SecureStorage.encrypt(
                              _model.cvvFieldController.text,
                            ),
                            expiryDate: _model.expireDateFieldController.text,
                            issueDate: _model.issueDateFieldController.text,
                            name: _model.nameFieldController.text,
                            note: _model.noteFieldController.text,
                            pin: await SecureStorage.encrypt(
                              _model.pinFieldController.text,
                            ),
                          ),
                        );
                        logFirebaseEvent(
                            'FinantcialCardCreateButton_close_dialog,');
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Update"),
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
