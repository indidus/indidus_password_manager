import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indidus_password_manager/src/lib/model_extension/login_extension.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/logins/delete_login_dialog/delete_login_dialog_widget.dart';
import '/components/logins/forms/update_login/update_login_widget.dart';
import '/components/logins/forms/view_login/view_login_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/logins.dart';
import 'login_cards_model.dart';

export 'login_cards_model.dart';

class LoginCardsWidget extends StatefulWidget {
  const LoginCardsWidget({
    super.key,
    required this.login,
    required this.refreshListCallback,
  });

  final Login login;
  final Future Function() refreshListCallback;

  @override
  State<LoginCardsWidget> createState() => _LoginCardsWidgetState();
}

class _LoginCardsWidgetState extends State<LoginCardsWidget> {
  late LoginCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCardsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              logFirebaseEvent('NOTES_CARDS_COMP_delete_ICN_ON_TAP');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: 300,
                      child: DeleteLoginDialogWidget(
                        login: widget.login,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              logFirebaseEvent('IconButton_execute_callback');
              await widget.refreshListCallback.call();
            },
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            foregroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) async {
              logFirebaseEvent('NOTES_CARDS_COMP_edit_ICN_ON_TAP');
              logFirebaseEvent('IconButton_bottom_sheet');
              var decryptLogin = await widget.login.decrypt();
              // ignore: use_build_context_synchronously
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      child: UpdateLoginWidget(
                        login: decryptLogin,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
              logFirebaseEvent('IconButton_execute_callback');
              await widget.refreshListCallback.call();
            },
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: ListTile(
        onTap: () async {
          logFirebaseEvent('NOTES_CARDS_COMP_visibility_ICN_ON_TAP');
          logFirebaseEvent('IconButton_bottom_sheet');
          var decryptLogin = await widget.login.decrypt();
          // ignore: use_build_context_synchronously
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: 360,
                  child: ViewLoginWidget(
                    login: decryptLogin,
                  ),
                ),
              );
            },
          );
        },
        isThreeLine: false,
        leading: SiteIconImage(
          initials: widget.login.name.isNotEmpty ? widget.login.name[0] : "A",
          url: widget.login.url,
        ),
        title: Text(
          widget.login.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.login.username,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ListMetadataChip(
              createdAt: widget.login.createdAt!,
              updatedAt: widget.login.updatedAt,
            ),
          ],
        ),
      ),
    );
  }
}
