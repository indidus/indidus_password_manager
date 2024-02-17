import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/logins.dart';
import 'view_login_model.dart';

export 'view_login_model.dart';

class ViewLoginWidget extends StatefulWidget {
  const ViewLoginWidget({
    super.key,
    required this.login,
  });

  final Login login;

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
        decoration: getModalBottomSheetBoxDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomSheetUpperBar(),
            const ModalBottomSheetHeaderText(level: "View login"),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    wrapWithModel(
                      model: _model.textFieldModel1,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Name',
                        fieldValue: widget.login.name,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel2,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Url',
                        fieldValue: widget.login.url ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel3,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Username',
                        fieldValue: widget.login.username,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel4,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Password',
                        fieldValue: widget.login.password ?? "",
                        mask: "********",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel5,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Password Hint',
                        fieldValue: widget.login.passwordHint ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel6,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Note',
                        fieldValue: widget.login.note ?? "",
                      ),
                    ),
                  ],
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
