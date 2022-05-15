import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/signin_signup/bloc/reset_pass/bloc_reset_pass.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';

class FormResetPass extends StatefulWidget {
  const FormResetPass(
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
  _FormResetPassState createState() => _FormResetPassState();
}

class _FormResetPassState extends State<FormResetPass> {
  String _rsCodeError;
  String _cfPasswordError;
  String _passwordError;
  Widget checkErrorText(String error) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldWidget(
            controller: widget.controller,
            obscureText: widget.obscureText ?? false,
            input: widget.input,
            focusNode: widget.focusNode,
            focusNext: widget.focusNext,
            colorBorderError: error == null
                ? const Color(0xFFF0F0F0)
                : const Color(0xFFFC2F39),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            textInputType: widget.textInputType),
        error != null
            ? AppWidget.textErrorStyle(textError: error)
            : const SizedBox()
      ],
    );
  }

  Widget createTextFieldError(TextFieldType type) {
    Widget child;
    switch (type) {
      case TextFieldType.code:
        child = checkErrorText(_rsCodeError);
        break;
      case TextFieldType.password:
        child = checkErrorText(_passwordError);
        break;
      case TextFieldType.cfPassword:
        child = checkErrorText(_cfPasswordError);
        break;
      default:
        child = checkErrorText(null);
        break;
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPassBloc, ResetPassState>(
      bloc: BlocProvider.of<ResetPassBloc>(context),
      builder: (context, state) {
        if (state is ResetPassFailure) {
          _rsCodeError = state.errorCode;
          _passwordError = state.errorPassword;
          _cfPasswordError = state.errorCfPassword;
        }
        if (state is ResetPassSuccess) {
          _rsCodeError = null;
          _passwordError = null;
          _cfPasswordError = null;
        }
        return createTextFieldError(widget.type);
      },
    );
  }
}
