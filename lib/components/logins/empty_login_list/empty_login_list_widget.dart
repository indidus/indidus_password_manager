import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'empty_login_list_model.dart';

export 'empty_login_list_model.dart';

class EmptyLoginListWidget extends StatefulWidget {
  const EmptyLoginListWidget({super.key});

  @override
  State<EmptyLoginListWidget> createState() => _EmptyLoginListWidgetState();
}

class _EmptyLoginListWidgetState extends State<EmptyLoginListWidget> {
  late EmptyLoginListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyLoginListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const EmptyListCard(
      title: 'No login are saved',
      description:
          'Please click the \'+\' button at the bottom right corner to add your first login details.',
    );
  }
}
