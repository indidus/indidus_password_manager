import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outdated_components/account_card/account_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bank_accounts_page_model.dart';
export 'bank_accounts_page_model.dart';

class BankAccountsPageWidget extends StatefulWidget {
  const BankAccountsPageWidget({super.key});

  @override
  _BankAccountsPageWidgetState createState() => _BankAccountsPageWidgetState();
}

class _BankAccountsPageWidgetState extends State<BankAccountsPageWidget> {
  late BankAccountsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BankAccountsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BankAccountsPage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Banks',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.logoutModel,
                      updateCallback: () => setState(() {}),
                      child: const LogoutWidget(),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 1.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: const BoxDecoration(),
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                wrapWithModel(
                  model: _model.accountCardModel,
                  updateCallback: () => setState(() {}),
                  child: const AccountCardWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
