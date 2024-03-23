import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/financial_cards.dart';
import 'view_fianacial_card_model.dart';

export 'view_fianacial_card_model.dart';

class ViewFianacialCardWidget extends StatefulWidget {
  const ViewFianacialCardWidget({
    super.key,
    required this.card,
  });

  final FinancialCard card;

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
        decoration: getModalBottomSheetBoxDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomSheetUpperBar(),
            const ModalBottomSheetHeaderText(level: "View Card"),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    wrapWithModel(
                      model: _model.textFieldModel1,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Name',
                        fieldValue: widget.card.name,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel2,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Card holder name',
                        fieldValue: widget.card.cardHolderName,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel3,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Card number',
                        fieldValue: widget.card.cardNumber,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel4,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Cvv',
                        fieldValue: widget.card.cvv ?? "",
                        mask: '***',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel5,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Pin',
                        fieldValue: widget.card.pin ?? "",
                        mask: '****',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel6,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Expire at',
                        fieldValue: widget.card.expiryDate ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel7,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Card type',
                        fieldValue: widget.card.cardType ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel8,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Card provider name',
                        fieldValue: widget.card.cardProviderName ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel9,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Issued at',
                        fieldValue: widget.card.issueDate ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel10,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Note',
                        fieldValue: widget.card.note ?? "",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              padding: getModalBottomSheetFooterPadding(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
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
