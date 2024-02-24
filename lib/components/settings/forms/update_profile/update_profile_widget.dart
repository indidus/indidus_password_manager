import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_profile_model.dart';

export 'update_profile_model.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  late UpdateProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateProfileModel());

    _model.nameFieldController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nameFieldFocusNode ??= FocusNode();
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
            const ModalBottomSheetHeaderText(level: "Update Profile Name"),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 16.0, 16.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => TextFormField(
                      controller: _model.nameFieldController,
                      focusNode: _model.nameFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: getInputDecoration(context, 'Name'),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: _model.nameFieldControllerValidator
                          .asValidator(context),
                    ),
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
                          'UPDATE_PROFILE_NoteUpdateButton_ON_TAP');
                      logFirebaseEvent('NoteUpdateButton_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        displayName: _model.nameFieldController.text,
                      ));
                      logFirebaseEvent('NoteUpdateButton_navigate_back');
                      context.pop();
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
