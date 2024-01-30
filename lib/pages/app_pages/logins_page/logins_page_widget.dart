import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/logins/empty_login_list/empty_login_list_widget.dart';
import '/components/logins/forms/create_login/create_login_widget.dart';
import '/components/logins/login_cards/login_cards_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logins_page_model.dart';
export 'logins_page_model.dart';

class LoginsPageWidget extends StatefulWidget {
  const LoginsPageWidget({super.key});

  @override
  State<LoginsPageWidget> createState() => _LoginsPageWidgetState();
}

class _LoginsPageWidgetState extends State<LoginsPageWidget> {
  late LoginsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginsPage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          onPressed: () async {
            logFirebaseEvent('LOGINS_FloatingActionButton_2r798tkq_ON_');
            logFirebaseEvent('FloatingActionButton_bottom_sheet');
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      child: CreateLoginWidget(
                        refreshCallback: () async {
                          logFirebaseEvent('_refresh_database_request');
                          setState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();
                        },
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            logFirebaseEvent('FloatingActionButton_refresh_database_re');
            setState(() => _model.requestCompleter = null);
            await _model.waitForRequestCompleted();
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: true,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Logins',
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
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
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            logFirebaseEvent(
                                'LOGINS_TextField_f5vk6e4x_ON_TEXTFIELD_S');
                            logFirebaseEvent('TextField_update_page_state');
                            setState(() {
                              _model.searchQuery = _model.textController.text;
                            });
                            logFirebaseEvent(
                                'TextField_refresh_database_request');
                            setState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                          },
                          textInputAction: TextInputAction.search,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Search',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            suffixIcon: _model.textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController?.clear();
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      size: 24.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: null,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    FutureBuilder<List<LoginsRow>>(
                      future: (_model.requestCompleter ??=
                              Completer<List<LoginsRow>>()
                                ..complete(LoginsTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'created_by',
                                        currentUserUid,
                                      )
                                      .order('created_at'),
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<LoginsRow> listViewLoginsRowList = snapshot.data!;
                        if (listViewLoginsRowList.isEmpty) {
                          return Center(
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 128.0,
                              child: const EmptyLoginListWidget(),
                            ),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            logFirebaseEvent(
                                'LOGINS_ListView_b8tupkag_ON_PULL_TO_REFR');
                            logFirebaseEvent(
                                'ListView_refresh_database_request');
                            setState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewLoginsRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewLoginsRow =
                                  listViewLoginsRowList[listViewIndex];
                              return wrapWithModel(
                                model: _model.loginCardsModels.getModel(
                                  listViewLoginsRow.id.toString(),
                                  listViewIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: LoginCardsWidget(
                                  key: Key(
                                    'Key51j_${listViewLoginsRow.id.toString()}',
                                  ),
                                  login: listViewLoginsRow,
                                  refreshListCallback: () async {
                                    logFirebaseEvent(
                                        'LOGINS_Container_51jrxfha_CALLBACK');
                                    logFirebaseEvent(
                                        'LoginCards_refresh_database_request');
                                    setState(
                                        () => _model.requestCompleter = null);
                                    await _model.waitForRequestCompleted();
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
