import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/financial_cards/delete_financial_card/delete_financial_card_widget.dart';
import '/components/financial_cards/forms/update_financial_card/update_financial_card_widget.dart';
import '/components/financial_cards/forms/view_fianacial_card/view_fianacial_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/financial_cards.dart';
import 'financial_cards_model.dart';

export 'financial_cards_model.dart';

class FinancialCardsWidget extends StatefulWidget {
  const FinancialCardsWidget({
    super.key,
    required this.card,
    required this.refreshListCallback,
  });

  final FinancialCard card;
  final Future Function() refreshListCallback;

  @override
  State<FinancialCardsWidget> createState() => _FinancialCardsWidgetState();
}

class _FinancialCardsWidgetState extends State<FinancialCardsWidget> {
  late FinancialCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinancialCardsModel());
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
              logFirebaseEvent('FINANTIAL_CARDS_DELETE_CLICKED');
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
                      child: DeleteFinancialCardWidget(
                        card: widget.card,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              await widget.refreshListCallback.call();
            },
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            foregroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) async {
              logFirebaseEvent(
                'FINANTIAL_CARDS_EDIT_CLICK',
              );
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
                      child: UpdateFinancialCardWidget(
                        card: widget.card,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

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
          logFirebaseEvent('FINANTIAL_CARDS_VIEW_CLICK');
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: 360,
                  child: ViewFianacialCardWidget(
                    card: widget.card,
                  ),
                ),
              );
            },
          );
        },
        isThreeLine: false,
        leading: const Icon(Icons.credit_card, size: 40),
        title: Text(
          widget.card.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'XXXX XXXX XXXX ${valueOrDefault<String>(
                widget.card.cardNumber.substring(14),
                'XXXX',
              )}',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ListMetadataChip(
              createdAt: widget.card.createdAt!,
              updatedAt: widget.card.updatedAt,
            ),
          ],
        ),
      ),
    );
  }
}
