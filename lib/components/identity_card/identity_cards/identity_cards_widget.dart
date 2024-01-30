import '/backend/supabase/supabase.dart';
import '/components/identity_card/delete_identity_card/delete_identity_card_widget.dart';
import '/components/identity_card/forms/update_identity_card/update_identity_card_widget.dart';
import '/components/identity_card/forms/view_identity_card/view_identity_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'identity_cards_model.dart';
export 'identity_cards_model.dart';

class IdentityCardsWidget extends StatefulWidget {
  const IdentityCardsWidget({
    super.key,
    required this.identity,
    required this.refreshListCallback,
  });

  final IdentityCardsRow? identity;
  final Future Function()? refreshListCallback;

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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1.0,
            color: Color(0x2F1D2429),
            offset: Offset(0.0, 1.0),
          )
        ],
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 64.0,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.identity?.name,
                            '-',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.identity?.nameOnCard,
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Text(
                          '${valueOrDefault<String>(
                            widget.identity?.identityCardType,
                            'OTHER Card',
                          )} - ${valueOrDefault<String>(
                            widget.identity?.identityCardNumber,
                            '-',
                          )}',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.identity?.updatedAt == null)
                          Text(
                            'Created  ${dateTimeFormat(
                              'relative',
                              widget.identity?.createdAt,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        if (widget.identity?.updatedAt != null)
                          Text(
                            'Updated ${dateTimeFormat(
                              'relative',
                              widget.identity?.updatedAt,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.visibility,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'IDENTITY_CARDS_visibility_ICN_ON_TAP');
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
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    child: ViewIdentityCardWidget(
                                      idCard: widget.identity!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.edit,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'IDENTITY_CARDS_COMP_edit_ICN_ON_TAP');
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
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    child: UpdateIdentityCardWidget(
                                      idCard: widget.identity!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            logFirebaseEvent('IconButton_execute_callback');
                            await widget.refreshListCallback?.call();
                          },
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.delete,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'IDENTITY_CARDS_COMP_delete_ICN_ON_TAP');
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
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.3,
                                    child: DeleteIdentityCardWidget(
                                      idCard: widget.identity!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            logFirebaseEvent('IconButton_execute_callback');
                            await widget.refreshListCallback?.call();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
