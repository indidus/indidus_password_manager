import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/components/identity_card/empty_identity_card_list/empty_identity_card_list_widget.dart';
import '/components/identity_card/forms/create_identity_card/create_identity_card_widget.dart';
import '/components/identity_card/identity_cards/identity_cards_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/api/simple.dart';
import '/src/rust/models/identity_cards.dart';
import 'identity_cards_page_model.dart';

export 'identity_cards_page_model.dart';

class IdentityCardsPageWidget extends StatefulWidget {
  const IdentityCardsPageWidget({super.key});

  @override
  State<IdentityCardsPageWidget> createState() =>
      _IdentityCardsPageWidgetState();
}

class _IdentityCardsPageWidgetState extends State<IdentityCardsPageWidget> {
  late IdentityCardsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IdentityCardsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'IdentityCardsPage'});
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
            logFirebaseEvent('IDENTITY_CARDS_FloatingActionButton_kdg6');
            logFirebaseEvent('FloatingActionButton_bottom_sheet');
            await showModalBottomSheet(
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
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: const CreateIdentityCardWidget(),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
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
              floating: true,
              snap: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Identities',
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
                                'IDENTITY_CARDS_TextField_i74hmzbv_ON_TEX');
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
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      decoration: const BoxDecoration(),
                      child: FutureBuilder<List<IdentityCard>>(
                        future: (_model.requestCompleter ??=
                                Completer<List<IdentityCard>>()
                                  ..complete(listIdentityCard(query: "{}")))
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
                          List<IdentityCard> listViewIdentityCardsRowList =
                              snapshot.data!;
                          if (listViewIdentityCardsRowList.isEmpty) {
                            return Center(
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 128.0,
                                child: const EmptyIdentityCardListWidget(),
                              ),
                            );
                          }
                          return RefreshIndicator(
                            onRefresh: () async {
                              logFirebaseEvent(
                                  'IDENTITY_CARDS_ListView_dxlxnu2u_ON_PULL');
                              logFirebaseEvent(
                                  'ListView_refresh_database_request');
                              setState(() => _model.requestCompleter = null);
                              await _model.waitForRequestCompleted();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewIdentityCardsRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewIdentityCardsRow =
                                    listViewIdentityCardsRowList[listViewIndex];
                                return wrapWithModel(
                                  model: _model.identityCardsModels.getModel(
                                    listViewIdentityCardsRow.id.toString(),
                                    listViewIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: IdentityCardsWidget(
                                    key: Key(
                                      'Key46l_${listViewIdentityCardsRow.id.toString()}',
                                    ),
                                    identity: listViewIdentityCardsRow,
                                    refreshListCallback: () async {},
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
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
