import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/storage.dart';

import '/components/logins/delete_login_dialog/delete_login_dialog_widget.dart';
import '/components/logins/forms/update_login/update_login_widget.dart';
import '/components/logins/forms/view_login/view_login_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/logins.dart';
import 'login_cards_model.dart';

export 'login_cards_model.dart';

class LoginCardsWidget extends StatefulWidget {
  const LoginCardsWidget({
    super.key,
    required this.login,
    required this.refreshListCallback,
  });

  final Login login;
  final Future Function()? refreshListCallback;

  @override
  State<LoginCardsWidget> createState() => _LoginCardsWidgetState();
}

class _LoginCardsWidgetState extends State<LoginCardsWidget> {
  late LoginCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCardsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'LOGIN_CARDS_COMP_Image_cxoxncct_ON_TAP');
                          if (widget.login.url != null &&
                              widget.login.url != '') {
                            logFirebaseEvent('Image_launch_u_r_l');
                            await launchURL(widget.login.url!);
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=256&url=${widget.login.url}',
                            width: 64.0,
                            height: 64.0,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
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
                              widget.login.name,
                              '-',
                            ),
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).listTileTheme.titleTextStyle,
                            // style: FlutterFlowTheme.of(context)
                            //     .headlineMedium
                            //     .override(
                            //       fontFamily: 'Readex Pro',
                            //       fontSize: 16.0,
                            //       fontWeight: FontWeight.w400,
                            //     ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'LOGIN_CARDS_COMP_Text_6ovnqf75_ON_TAP');
                                if (widget.login.url != null &&
                                    widget.login.url != '') {
                                  logFirebaseEvent('Text_launch_u_r_l');
                                  await launchURL(widget.login.url!);
                                }
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  widget.login.url,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                          Text(
                            'Username : ${widget.login.username}',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 0.0, 0.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.login.updatedAt == null)
                            Text(
                              'Created  ${dateTimeFormat(
                                'relative',
                                widget.login.createdAt,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          if (widget.login.updatedAt != null)
                            Text(
                              'Updated ${dateTimeFormat(
                                'relative',
                                widget.login.updatedAt,
                                locale:
                                    FFLocalizations.of(context).languageCode,
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 12.0, 0.0),
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
                                  'LOGIN_CARDS_COMP_visibility_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              var login = Login(
                                id: widget.login.id,
                                createdAt: widget.login.createdAt,
                                createdBy: widget.login.createdBy,
                                updatedAt: widget.login.updatedAt,
                                updatedBy: widget.login.updatedBy,
                                name: widget.login.name,
                                note: widget.login.note,
                                username: widget.login.username,
                                url: widget.login.url,
                                password: widget.login.password != null
                                    ? await SecureStorage.decrypt(
                                        widget.login.password!,
                                      )
                                    : null,
                                passwordHint: widget.login.passwordHint,
                              );
                              // ignore: use_build_context_synchronously
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
                                          MediaQuery.sizeOf(context).height *
                                              0.8,
                                      child: ViewLoginWidget(
                                        login: login,
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
                                  'LOGIN_CARDS_COMP_edit_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              var login = Login(
                                id: widget.login.id,
                                createdAt: widget.login.createdAt,
                                createdBy: widget.login.createdBy,
                                updatedAt: widget.login.updatedAt,
                                updatedBy: widget.login.updatedBy,
                                name: widget.login.name,
                                note: widget.login.note,
                                username: widget.login.username,
                                url: widget.login.url,
                                password: widget.login.password != null
                                    ? await SecureStorage.decrypt(
                                        widget.login.password!,
                                      )
                                    : null,
                                passwordHint: widget.login.passwordHint,
                              );
                              // ignore: use_build_context_synchronously
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
                                          MediaQuery.sizeOf(context).height *
                                              0.8,
                                      child: UpdateLoginWidget(
                                        login: login,
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
                                  'LOGIN_CARDS_COMP_delete_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              var login = Login(
                                id: widget.login.id,
                                createdAt: widget.login.createdAt,
                                createdBy: widget.login.createdBy,
                                updatedAt: widget.login.updatedAt,
                                updatedBy: widget.login.updatedBy,
                                name: widget.login.name,
                                note: widget.login.note,
                                username: widget.login.username,
                                url: widget.login.url,
                                password: widget.login.password != null
                                    ? await SecureStorage.decrypt(
                                        widget.login.password!,
                                      )
                                    : null,
                                passwordHint: widget.login.passwordHint,
                              );
                              // ignore: use_build_context_synchronously
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
                                      child: DeleteLoginDialogWidget(
                                        login: login,
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
      ),
    );
  }
}
