import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/identity_cards.dart';
import 'view_identity_card_model.dart';

export 'view_identity_card_model.dart';

class ViewIdentityCardWidget extends StatefulWidget {
  const ViewIdentityCardWidget({
    super.key,
    required this.idCard,
  });

  final IdentityCard idCard;

  @override
  State<ViewIdentityCardWidget> createState() => _ViewIdentityCardWidgetState();
}

class _ViewIdentityCardWidgetState extends State<ViewIdentityCardWidget> {
  late ViewIdentityCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewIdentityCardModel());
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
          minHeight: MediaQuery.sizeOf(context).height * 0.9,
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
        decoration: getModalBottomSheetBoxDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomSheetUpperBar(),
            const ModalBottomSheetHeaderText(level: "View identity card"),
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
                        fieldValue: widget.idCard.name,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel2,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Name on card',
                        fieldValue: widget.idCard.nameOnCard,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel3,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Card number',
                        fieldValue: widget.idCard.identityCardNumber,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel4,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Country',
                        fieldValue: widget.idCard.country ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel5,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'State / Provision',
                        fieldValue: widget.idCard.state ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel6,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Card type',
                        fieldValue: widget.idCard.identityCardType ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel7,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Issued at',
                        fieldValue: widget.idCard.issueDate ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel8,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Expire at',
                        fieldValue: widget.idCard.expiryDate ?? "",
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel9,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Note',
                        fieldValue: widget.idCard.note ?? "",
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
