import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_identity_card_widget.dart' show UpdateIdentityCardWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateIdentityCardModel
    extends FlutterFlowModel<UpdateIdentityCardWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for nameOnCardField widget.
  FocusNode? nameOnCardFieldFocusNode;
  TextEditingController? nameOnCardFieldController;
  String? Function(BuildContext, String?)? nameOnCardFieldControllerValidator;
  // State field(s) for cardNumberField widget.
  FocusNode? cardNumberFieldFocusNode;
  TextEditingController? cardNumberFieldController;
  String? Function(BuildContext, String?)? cardNumberFieldControllerValidator;
  // State field(s) for countryField widget.
  FocusNode? countryFieldFocusNode;
  TextEditingController? countryFieldController;
  String? Function(BuildContext, String?)? countryFieldControllerValidator;
  // State field(s) for stateField widget.
  FocusNode? stateFieldFocusNode;
  TextEditingController? stateFieldController;
  String? Function(BuildContext, String?)? stateFieldControllerValidator;
  // State field(s) for cardTypeField widget.
  String? cardTypeFieldValue;
  FormFieldController<String>? cardTypeFieldValueController;
  // State field(s) for issueDateField widget.
  FocusNode? issueDateFieldFocusNode;
  TextEditingController? issueDateFieldController;
  final issueDateFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? issueDateFieldControllerValidator;
  // State field(s) for expireDateField widget.
  FocusNode? expireDateFieldFocusNode;
  TextEditingController? expireDateFieldController;
  final expireDateFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? expireDateFieldControllerValidator;
  // State field(s) for noteField widget.
  FocusNode? noteFieldFocusNode;
  TextEditingController? noteFieldController;
  String? Function(BuildContext, String?)? noteFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    nameOnCardFieldFocusNode?.dispose();
    nameOnCardFieldController?.dispose();

    cardNumberFieldFocusNode?.dispose();
    cardNumberFieldController?.dispose();

    countryFieldFocusNode?.dispose();
    countryFieldController?.dispose();

    stateFieldFocusNode?.dispose();
    stateFieldController?.dispose();

    issueDateFieldFocusNode?.dispose();
    issueDateFieldController?.dispose();

    expireDateFieldFocusNode?.dispose();
    expireDateFieldController?.dispose();

    noteFieldFocusNode?.dispose();
    noteFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
