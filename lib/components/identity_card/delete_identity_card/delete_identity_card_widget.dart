import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/identity_cards.dart';
import 'delete_identity_card_model.dart';

export 'delete_identity_card_model.dart';

class DeleteIdentityCardWidget extends StatefulWidget {
  const DeleteIdentityCardWidget({
    super.key,
    required this.idCard,
  });

  final IdentityCard idCard;

  @override
  State<DeleteIdentityCardWidget> createState() =>
      _DeleteIdentityCardWidgetState();
}

class _DeleteIdentityCardWidgetState extends State<DeleteIdentityCardWidget> {
  late DeleteIdentityCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteIdentityCardModel());
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
                      Icon(
                        Icons.person,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 60.0,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Delete this identity card?',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Are you sure you want to delete this identity card? it is not reversible...',
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
                              'DELETE_IDENTITY_CARD_DeleteButton_ON_TAP');
                          logFirebaseEvent('DeleteButton_backend_call');
                          deleteIdentityCard(id: widget.idCard.id!);
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
