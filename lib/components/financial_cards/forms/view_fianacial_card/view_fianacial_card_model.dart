import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_fianacial_card_widget.dart' show ViewFianacialCardWidget;
import 'package:flutter/material.dart';

class ViewFianacialCardModel extends FlutterFlowModel<ViewFianacialCardWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for TextField component.
  late TextFieldModel textFieldModel1;
  // Model for TextField component.
  late TextFieldModel textFieldModel2;
  // Model for TextField component.
  late TextFieldModel textFieldModel3;
  // Model for TextField component.
  late TextFieldModel textFieldModel4;
  // Model for TextField component.
  late TextFieldModel textFieldModel5;
  // Model for TextField component.
  late TextFieldModel textFieldModel6;
  // Model for TextField component.
  late TextFieldModel textFieldModel7;
  // Model for TextField component.
  late TextFieldModel textFieldModel8;
  // Model for TextField component.
  late TextFieldModel textFieldModel9;
  // Model for TextField component.
  late TextFieldModel textFieldModel10;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
    textFieldModel3 = createModel(context, () => TextFieldModel());
    textFieldModel4 = createModel(context, () => TextFieldModel());
    textFieldModel5 = createModel(context, () => TextFieldModel());
    textFieldModel6 = createModel(context, () => TextFieldModel());
    textFieldModel7 = createModel(context, () => TextFieldModel());
    textFieldModel8 = createModel(context, () => TextFieldModel());
    textFieldModel9 = createModel(context, () => TextFieldModel());
    textFieldModel10 = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    textFieldModel1.dispose();
    textFieldModel2.dispose();
    textFieldModel3.dispose();
    textFieldModel4.dispose();
    textFieldModel5.dispose();
    textFieldModel6.dispose();
    textFieldModel7.dispose();
    textFieldModel8.dispose();
    textFieldModel9.dispose();
    textFieldModel10.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
