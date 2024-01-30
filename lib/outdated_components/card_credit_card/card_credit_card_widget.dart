import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'card_credit_card_model.dart';
export 'card_credit_card_model.dart';

class CardCreditCardWidget extends StatefulWidget {
  const CardCreditCardWidget({super.key});

  @override
  State<CardCreditCardWidget> createState() => _CardCreditCardWidgetState();
}

class _CardCreditCardWidgetState extends State<CardCreditCardWidget> {
  late CardCreditCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardCreditCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 370.0,
        height: 190.0,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 6.0,
              color: Color(0x4B1A1F24),
              offset: Offset(0.0, 2.0),
            )
          ],
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).tertiary,
              FlutterFlowTheme.of(context).primary,
              const Color(0xFF673AB7)
            ],
            stops: const [0.0, 0.4, 1.0],
            begin: const AlignmentDirectional(0.91, -1.0),
            end: const AlignmentDirectional(-0.91, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/default-project-widgets-xzsp5v/assets/ddr0sc80h0hs/@3xlogoMark_outline.png',
                width: 44.0,
                height: 44.0,
                fit: BoxFit.cover,
              ),
              Text(
                'Balance',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
              ),
              Text(
                '\$7,630',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 32.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '**** 0149',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      '05/25',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
