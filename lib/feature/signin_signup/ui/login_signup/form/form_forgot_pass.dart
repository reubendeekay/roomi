import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/signin_signup/bloc/forgot_pass/bloc_forgot_pass.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';

class FormForgotPass extends StatefulWidget {
  const FormForgotPass(
      {Key key,
      this.controller,
      this.input,
      this.focusNode,
      this.suffixIcon,
      this.textInputType,
      this.focusNext,
      this.obscureText,
      this.type,
      this.prefixIcon})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode focusNext;
  final String input;
  final TextInputType textInputType;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextFieldType type;

  @override
  _FormForgotPassState createState() => _FormForgotPassState();
}

class _FormForgotPassState extends State<FormForgotPass> {
  String _emailError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPassBloc, ForgotPassState>(
      bloc: BlocProvider.of<ForgotPassBloc>(context),
      builder: (context, state) {
        if (state is ForgotPassFailure) {
          _emailError = state.errorEmail;
        }
        if (state is ForgotPassSuccess) {
          _emailError = null;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldWidget(
                controller: widget.controller,
                obscureText: widget.obscureText ?? false,
                input: widget.input,
                focusNode: widget.focusNode,
                focusNext: widget.focusNext,
                colorBorderError: _emailError == null
                    ? const Color(0xFFF0F0F0)
                    : const Color(0xFFFC2F39),
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
                textInputType: widget.textInputType),
            _emailError != null
                ? AppWidget.textErrorStyle(textError: _emailError)
                : const SizedBox()
          ],
        );
      },
    );
  }
}
