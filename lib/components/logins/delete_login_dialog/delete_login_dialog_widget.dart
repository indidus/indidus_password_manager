import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/api/simple.dart';
import '/src/rust/models/logins.dart';
import 'delete_login_dialog_model.dart';

export 'delete_login_dialog_model.dart';

class DeleteLoginDialogWidget extends StatefulWidget {
  const DeleteLoginDialogWidget({
    super.key,
    required this.login,
  });

  final Login login;

  @override
  State<DeleteLoginDialogWidget> createState() =>
      _DeleteLoginDialogWidgetState();
}

class _DeleteLoginDialogWidgetState extends State<DeleteLoginDialogWidget> {
  late DeleteLoginDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteLoginDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
          ),
          decoration: getModalBottomSheetBoxDecoration(context, isAll: true),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 16.0, 24.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SiteIconImage(
                        url: widget.login.url ?? "",
                        initials: widget.login.name[0],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Delete this login?...',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Are you sure you want to delete this login details? it is not reversible...',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 12.0, 0.0),
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                      ),
                      FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.error,
                          ),
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'DELETE_LOGIN_DIALOG_DeleteButton_ON_TAP');
                          logFirebaseEvent('DeleteButton_backend_call');

                          await deleteLogin(id: widget.login.id!);
                          logFirebaseEvent(
                              'DeleteButton_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                        },
                        child: const Text("Delete"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
