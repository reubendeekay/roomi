import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

enum TextFieldType {
  email,
  password,
  cfPassword,
  code,
  fullName,
  birthday,
  phone,
  job,
  place,
  infoMe,
  rent,
  deposit,
  available,
  genderAmount,
  moveDate
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key key,
      this.controller,
      this.input,
      this.focusNode,
      this.suffixIcon,
      this.textInputType,
      this.focusNext,
      this.obscureText,
      this.prefixIcon,
      this.colorBorderError})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode focusNext;
  final String input;
  final TextInputType textInputType;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Color colorBorderError;

  UnderlineInputBorder createInputDecoration() {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFFFFFFF), width: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: colorBorderError, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          focusNode: focusNode,
          keyboardType: textInputType ?? TextInputType.text,
          onFieldSubmitted: (term) {
            focusNode.unfocus();
            FocusScope.of(context).requestFocus(focusNext);
          },
          style: AppWidget.boldTextFieldStyle(
              color: const Color(0xFF020433),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              height: 20),
          decoration: InputDecoration(
            prefix: prefixIcon,
            suffixIcon: suffixIcon,
            labelText: input,
            labelStyle: AppWidget.simpleTextFieldStyle(
                fontSize: focusNode.hasFocus ? 12 : 14,
                color: focusNode.hasFocus
                    ? const Color(0xFF404B69)
                    : const Color(0xFF95A0B6),
                height: focusNode.hasFocus ? 15 : 17),
            focusedErrorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.red, width: 1)),
            errorBorder: createInputDecoration(),
            focusedBorder: createInputDecoration(),
            enabledBorder: createInputDecoration(),
          )),
    );
  }
}
