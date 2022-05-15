import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class TextFieldPhone extends StatelessWidget {
  const TextFieldPhone(
      {Key key,
      this.controller,
      this.input,
      this.focusNode,
      this.focusNext,
      this.suffixIcon,
      this.colorBorderError})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode focusNext;
  final String input;
  final Widget suffixIcon;
  final Color colorBorderError;

  UnderlineInputBorder createInputDecoration() {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFFFFFFF), width: 1));
  }

  @override
  Widget build(BuildContext context) {
    final double width = AppWidget.getWidthScreen(context);
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(
              color: colorBorderError ?? const Color(0xFFF0F0F0), width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.phone,
          style: AppWidget.boldTextFieldStyle(
              color: const Color(0xFF020433),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              height: 20),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefix: CountryCodePicker(
              onChanged: (value) {
                print(value.name);
              },
              builder: (value) {
                return SizedBox(
                  width: width / 5,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        value.flagUri,
                        package: 'country_code_picker',
                        height: 16,
                        width: 28,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          value.dialCode,
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF95A0B6),
                              height: 19.5,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
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
