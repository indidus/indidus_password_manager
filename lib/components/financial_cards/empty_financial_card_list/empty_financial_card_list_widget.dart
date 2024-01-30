import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Text(
                  'No credit/debit cards are saved',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Text(
                'Please click the \'+\' button at the bottom right corner to add your first credit/debit card details.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
