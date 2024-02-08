import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/identity_card/delete_identity_card/delete_identity_card_widget.dart';
import '/components/identity_card/forms/update_identity_card/update_identity_card_widget.dart';
import '/components/identity_card/forms/view_identity_card/view_identity_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/identity_cards.dart';
import 'identity_cards_model.dart';

export 'identity_cards_model.dart';

class IdentityCardsWidget extends StatefulWidget {
  const IdentityCardsWidget({
    super.key,
    required this.identity,
    required this.refreshListCallback,
  });

  final IdentityCard identity;
  final Future Function() refreshListCallback;

  @override
  State<IdentityCardsWidget> createState() => _IdentityCardsWidgetState();
}

class _IdentityCardsWidgetState extends State<IdentityCardsWidget> {
  late IdentityCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IdentityCardsModel());
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
              logFirebaseEvent('IconButton_bottom_sheet');
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
                      child: DeleteIdentityCardWidget(
                        idCard: widget.identity,
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
                      child: UpdateIdentityCardWidget(
                        idCard: widget.identity,
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
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: ViewIdentityCardWidget(
                    idCard: widget.identity,
                  ),
                ),
              );
            },
          );
        },
        isThreeLine: false,
        leading: const Icon(Icons.contact_page_sharp, size: 40),
        title: Text(
          widget.identity.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.identity.identityCardNumber,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ListMetadataChip(
              createdAt: widget.identity.createdAt!,
              updatedAt: widget.identity.updatedAt,
            ),
          ],
        ),
      ),
    );
  }
}
