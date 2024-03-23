import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'empty_financial_card_list_model.dart';

export 'empty_financial_card_list_model.dart';

class EmptyFinancialCardListWidget extends StatefulWidget {
  const EmptyFinancialCardListWidget({super.key});

  @override
  State<EmptyFinancialCardListWidget> createState() =>
      _EmptyFinancialCardListWidgetState();
}

class _EmptyFinancialCardListWidgetState
    extends State<EmptyFinancialCardListWidget> {
  late EmptyFinancialCardListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFinancialCardListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const EmptyListCard(
      title: 'No credit/debit cards are saved',
      description:
          'Please click the \'+\' button at the bottom right corner to add your first credit/debit card details.',
    );
  }
}
