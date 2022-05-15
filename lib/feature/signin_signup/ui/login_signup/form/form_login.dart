import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/signin_signup/bloc/sign_in/bloc_signin.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';

class FormLogin extends StatefulWidget {
  const FormLogin(
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
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  String _emailError;
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
      case TextFieldType.email:
        child = checkErrorText(_emailError);
        break;
      case TextFieldType.password:
        child = checkErrorText(_passwordError);
        break;
      default:
        child = checkErrorText(null);
        break;
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      bloc: BlocProvider.of<SignInBloc>(context),
      builder: (context, state) {
        if (state is SignInFailure) {
          _emailError = state.errorEmail;
          _passwordError = state.errorPassword;
        }
        if (state is SignInSuccess) {
          _emailError = null;
          _passwordError = null;
        }
        return createTextFieldError(widget.type);
      },
    );
  }
}
