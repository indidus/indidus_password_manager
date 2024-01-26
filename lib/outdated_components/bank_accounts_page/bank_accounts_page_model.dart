import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outdated_components/account_card/account_card_widget.dart';
import 'bank_accounts_page_widget.dart' show BankAccountsPageWidget;
import 'package:flutter/material.dart';

class BankAccountsPageModel extends FlutterFlowModel<BankAccountsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AccountCard component.
  late AccountCardModel accountCardModel;
  // Model for Logout component.
  late LogoutModel logoutModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    accountCardModel = createModel(context, () => AccountCardModel());
    logoutModel = createModel(context, () => LogoutModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    accountCardModel.dispose();
    logoutModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
