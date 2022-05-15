import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class TextFieldAboutInfo extends StatefulWidget {
  const TextFieldAboutInfo(
      {Key key,
      this.controller,
      this.input,
      this.focusNode,
      this.suffixIcon,
      this.focusNext,
      this.prefixIcon,
      this.onChanged,
      this.colorBorderError})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode focusNext;
  final String input;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Color colorBorderError;
  final Function(String val) onChanged;

  @override
  State<TextFieldAboutInfo> createState() => _TextFieldAboutInfoState();
}

class _TextFieldAboutInfoState extends State<TextFieldAboutInfo> {
  UnderlineInputBorder createInputDecoration() {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFFFFFFF), width: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.colorBorderError ?? const Color(0xFFF0F0F0),
              width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: (val) {
            if (widget.onChanged != null) {
              setState(() {
                widget.onChanged(val);
              });
              print(val);
            }
          },
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onFieldSubmitted: (term) {
            widget.focusNode.unfocus();
            FocusScope.of(context).requestFocus(widget.focusNext);
          },
          style: AppWidget.boldTextFieldStyle(
              color: const Color(0xFF020433),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              height: 20),
          decoration: InputDecoration(
            prefix: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            labelText: widget.input,
            labelStyle: AppWidget.simpleTextFieldStyle(
                fontSize: 14,
                color: widget.focusNode.hasFocus
                    ? const Color(0xFF404B69)
                    : const Color(0xFF95A0B6),
                height: widget.focusNode.hasFocus ? 15 : 17),
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
