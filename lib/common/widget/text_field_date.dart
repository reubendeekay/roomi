import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roomy/app/widget_support.dart';

class TextFieldDate extends StatefulWidget {
  const TextFieldDate(
      {Key key,
      this.controller,
      this.input,
      this.focusNode,
      this.focusNext,
      this.prefixIcon,
      this.colorBorderError})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode focusNext;
  final String input;
  final Widget prefixIcon;
  final Color colorBorderError;

  @override
  _TextFieldDateState createState() => _TextFieldDateState();
}

class _TextFieldDateState extends State<TextFieldDate> {
  DateTime selectedDate = DateTime.now();

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
          border: Border.all(
              color: widget.colorBorderError ?? const Color(0xFFF0F0F0),
              width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        readOnly: true,
        style: AppWidget.boldTextFieldStyle(
            color: const Color(0xFF020433),
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            height: 20),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: GestureDetector(
              onTap: () async {
                final DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2025),
                );
                if (picked != null && picked != selectedDate)
                  setState(() {
                    widget.controller.text = DateFormat.yMMMMd().format(picked);
                  });
              },
              child: Image.asset('images/log_in/ic_date_step_3@1x.png')),
          labelText: widget.input,
          labelStyle: AppWidget.simpleTextFieldStyle(
              fontSize: widget.focusNode.hasFocus ? 12 : 14,
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
        ),
      ),
    );
  }
}
