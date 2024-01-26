import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_financial_card_widget.dart' show CreateFinancialCardWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateFinancialCardModel
    extends FlutterFlowModel<CreateFinancialCardWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for cardHolderNameField widget.
  FocusNode? cardHolderNameFieldFocusNode;
  TextEditingController? cardHolderNameFieldController;
  String? Function(BuildContext, String?)?
      cardHolderNameFieldControllerValidator;
  // State field(s) for cardNumberField widget.
  FocusNode? cardNumberFieldFocusNode;
  TextEditingController? cardNumberFieldController;
  final cardNumberFieldMask =
      MaskTextInputFormatter(mask: '####-####-####-####');
  String? Function(BuildContext, String?)? cardNumberFieldControllerValidator;
  // State field(s) for cardProviderNameField widget.
  FocusNode? cardProviderNameFieldFocusNode;
  TextEditingController? cardProviderNameFieldController;
  String? Function(BuildContext, String?)?
      cardProviderNameFieldControllerValidator;
  // State field(s) for pinField widget.
  FocusNode? pinFieldFocusNode;
  TextEditingController? pinFieldController;
  late bool pinFieldVisibility;
  final pinFieldMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? pinFieldControllerValidator;
  // State field(s) for cvvField widget.
  FocusNode? cvvFieldFocusNode;
  TextEditingController? cvvFieldController;
  late bool cvvFieldVisibility;
  final cvvFieldMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvFieldControllerValidator;
  // State field(s) for cardTypeField widget.
  String? cardTypeFieldValue;
  FormFieldController<String>? cardTypeFieldValueController;
  // State field(s) for issueDateField widget.
  FocusNode? issueDateFieldFocusNode;
  TextEditingController? issueDateFieldController;
  String? Function(BuildContext, String?)? issueDateFieldControllerValidator;
  // State field(s) for expireDateField widget.
  FocusNode? expireDateFieldFocusNode;
  TextEditingController? expireDateFieldController;
  String? Function(BuildContext, String?)? expireDateFieldControllerValidator;
  // State field(s) for noteField widget.
  FocusNode? noteFieldFocusNode;
  TextEditingController? noteFieldController;
  String? Function(BuildContext, String?)? noteFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinFieldVisibility = false;
    cvvFieldVisibility = false;
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    cardHolderNameFieldFocusNode?.dispose();
    cardHolderNameFieldController?.dispose();

    cardNumberFieldFocusNode?.dispose();
    cardNumberFieldController?.dispose();

    cardProviderNameFieldFocusNode?.dispose();
    cardProviderNameFieldController?.dispose();

    pinFieldFocusNode?.dispose();
    pinFieldController?.dispose();

    cvvFieldFocusNode?.dispose();
    cvvFieldController?.dispose();

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
