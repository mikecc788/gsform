import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gsform/gs_form/model/fields_model/bank_card_filed_model.dart';

import '../../core/field_callback.dart';
import '../../core/form_style.dart';
import '../../util/util.dart';

// ignore: must_be_immutable
class GSBankCardField extends HookWidget implements GSFieldCallBack {
  GSBankCardModel model;
  late var controller ;
  GSFormStyle formStyle;

  GSBankCardField(this.model, this.formStyle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = useTextEditingController() ;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: TextField(
        inputFormatters: [CardNumberFormatter()],
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        controller: controller,
        maxLines: 1,
        style: formStyle.fieldTextStyle,
        keyboardType: TextInputType.number,
        focusNode: model.focusNode,
        textInputAction: model.nextFocusNode != null
            ? TextInputAction.next
            : TextInputAction.done,
        onSubmitted: (_) {
          FocusScope.of(context).requestFocus(model.nextFocusNode);
        },
        decoration: InputDecoration(
          hintText: model.hint ?? '- - - -   - - - -   - - - -   - - - -',
          counterText: '',
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: formStyle.fieldHintStyle,
        ),
      ),
    );
  }

  @override
  getValue() {
    return controller!.text.replaceAll(' ', '');
  }

  @override
  bool isValid() {
    if (model.validateRegEx == null) {
      if (!(model.required ?? false)) {
        return true;
      } else {
        return controller!.text.replaceAll(' ', '').length == 16;
      }
    } else {
      return model.validateRegEx!.hasMatch(controller!.text);
    }
  }
}
