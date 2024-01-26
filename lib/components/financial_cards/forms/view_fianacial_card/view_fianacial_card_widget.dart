import '/backend/supabase/supabase.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'view_fianacial_card_model.dart';
export 'view_fianacial_card_model.dart';

class ViewFianacialCardWidget extends StatefulWidget {
  const ViewFianacialCardWidget({
    super.key,
    required this.card,
  });

  final FinancialCardsRow? card;

  @override
  State<ViewFianacialCardWidget> createState() =>
      _ViewFianacialCardWidgetState();
}

class _ViewFianacialCardWidgetState extends State<ViewFianacialCardWidget> {
  late ViewFianacialCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewFianacialCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.6,
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x33000000),
              offset: Offset(0.0, -2.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'View Card',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.w300,
                              ),
                    ),
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.textFieldModel1,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Name',
                  fieldValue: widget.card!.name,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel2,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Card holder name',
                  fieldValue: widget.card!.cardHolderName,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel3,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Card number',
                  fieldValue: widget.card!.cardNumber,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel4,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Cvv',
                  fieldValue: widget.card!.cvv!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel5,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Pin',
                  fieldValue: widget.card!.pin!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel6,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Expire at',
                  fieldValue: widget.card!.expiryDate!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel7,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Card type',
                  fieldValue: widget.card!.cardType!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel8,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Card provider name',
                  fieldValue: widget.card!.cardProviderName!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel9,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Issued at',
                  fieldValue: widget.card!.issueDate!,
                ),
              ),
              wrapWithModel(
                model: _model.textFieldModel10,
                updateCallback: () => setState(() {}),
                child: TextFieldWidget(
                  fieldName: 'Note',
                  fieldValue: widget.card!.note!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
