import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/storage.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/api/simple.dart';
import '/src/rust/models/logins.dart';
import 'update_login_model.dart';

export 'update_login_model.dart';

class UpdateLoginWidget extends StatefulWidget {
  const UpdateLoginWidget({
    super.key,
    required this.login,
  });

  final Login login;

  @override
  State<UpdateLoginWidget> createState() => _UpdateLoginWidgetState();
}

class _UpdateLoginWidgetState extends State<UpdateLoginWidget> {
  late UpdateLoginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateLoginModel());

    _model.nameFieldController ??=
        TextEditingController(text: widget.login.name);
    _model.nameFieldFocusNode ??= FocusNode();

    _model.usernameFieldController ??=
        TextEditingController(text: widget.login.username);
    _model.usernameFieldFocusNode ??= FocusNode();

    _model.passwordFieldController ??=
        TextEditingController(text: widget.login.password);
    _model.passwordFieldFocusNode ??= FocusNode();

    _model.urlFieldController ??= TextEditingController(text: widget.login.url);
    _model.urlFieldFocusNode ??= FocusNode();

    _model.passwordHintFieldController ??=
        TextEditingController(text: widget.login.passwordHint);
    _model.passwordHintFieldFocusNode ??= FocusNode();

    _model.noteFieldController ??=
        TextEditingController(text: widget.login.note);
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
                          controller: _model.nameFieldController,
                          focusNode: _model.nameFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Name",
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.nameFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.usernameFieldController,
                          focusNode: _model.usernameFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Username",
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.usernameFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.passwordFieldController,
                          focusNode: _model.passwordFieldFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          obscureText: !_model.passwordFieldVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
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
                                () => _model.passwordFieldVisibility =
                                    !_model.passwordFieldVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordFieldVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.visiblePassword,
                          validator: _model.passwordFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.urlFieldController,
                          focusNode: _model.urlFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Url",
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.url,
                          validator: _model.urlFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.passwordHintFieldController,
                          focusNode: _model.passwordHintFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Password Hint",
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.url,
                          validator: _model.passwordHintFieldControllerValidator
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
                          style: FlutterFlowTheme.of(context).bodyMedium,
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
                            'UPDATE_LOGIN_NoteUpdateButton_ON_TAP');
                        logFirebaseEvent('NoteUpdateButton_backend_call');

                        await putLogin(
                          id: widget.login.id!,
                          data: Login(
                            createdAt: widget.login.createdAt,
                            createdBy: widget.login.createdBy,
                            updatedAt: getCurrentTimestamp,
                            updatedBy: currentUserUid,
                            name: _model.nameFieldController.text,
                            note: _model.noteFieldController.text,
                            username: _model.usernameFieldController.text,
                            url: _model.urlFieldController.text,
                            password: await SecureStorage.encrypt(
                              _model.passwordFieldController.text,
                            ),
                            passwordHint:
                                _model.passwordHintFieldController.text,
                          ),
                        );
                        logFirebaseEvent(
                            'NoteUpdateButton_close_dialog,_drawer,_e');
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
