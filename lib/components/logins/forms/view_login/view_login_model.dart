import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_login_widget.dart' show ViewLoginWidget;
import 'package:flutter/material.dart';

class ViewLoginModel extends FlutterFlowModel<ViewLoginWidget> {
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
    textFieldModel3 = createModel(context, () => TextFieldModel());
    textFieldModel4 = createModel(context, () => TextFieldModel());
    textFieldModel5 = createModel(context, () => TextFieldModel());
    textFieldModel6 = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    textFieldModel1.dispose();
    textFieldModel2.dispose();
    textFieldModel3.dispose();
    textFieldModel4.dispose();
    textFieldModel5.dispose();
    textFieldModel6.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
