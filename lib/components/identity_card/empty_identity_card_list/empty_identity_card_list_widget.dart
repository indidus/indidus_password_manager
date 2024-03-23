import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'empty_identity_card_list_model.dart';

export 'empty_identity_card_list_model.dart';

class EmptyIdentityCardListWidget extends StatefulWidget {
  const EmptyIdentityCardListWidget({super.key});

  @override
  State<EmptyIdentityCardListWidget> createState() =>
      _EmptyIdentityCardListWidgetState();
}

class _EmptyIdentityCardListWidgetState
    extends State<EmptyIdentityCardListWidget> {
  late EmptyIdentityCardListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyIdentityCardListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const EmptyListCard(
      title: 'No identity cards are saved',
      description:
          'Please click on the \'+\' button at the bottom right corner to add your first identity card details.',
    );
  }
}
