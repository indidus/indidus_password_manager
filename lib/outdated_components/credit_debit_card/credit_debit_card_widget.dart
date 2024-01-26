import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'credit_debit_card_model.dart';
export 'credit_debit_card_model.dart';

class CreditDebitCardWidget extends StatefulWidget {
  const CreditDebitCardWidget({super.key});

  @override
  State<CreditDebitCardWidget> createState() => _CreditDebitCardWidgetState();
}

class _CreditDebitCardWidgetState extends State<CreditDebitCardWidget> {
  late CreditDebitCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreditDebitCardModel());
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
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.network(
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/card-u-i-9c4s01/assets/tj0nkrs6wiu4/card_10.1.png',
          ).image,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HDFC Bank',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                    Text(
                      'Deoghar, Near Tower Chowk',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/card-u-i-9c4s01/assets/i3ulgm3w403f/master_2.png',
                    width: 79.0,
                    height: 48.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Text(
              'Ritesh S.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                  child: Text(
                    '3492 0892 8204 1832',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 1.5,
                        ),
                  ),
                ),
                Text(
                  '07/27',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: Text(
                    'PIN ****',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 1.5,
                        ),
                  ),
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 16.0,
                ),
                Icon(
                  Icons.content_copy,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 16.0,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 8.0, 0.0),
                  child: Text(
                    'CVV ***',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 16.0,
                ),
                Icon(
                  Icons.content_copy,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 16.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
