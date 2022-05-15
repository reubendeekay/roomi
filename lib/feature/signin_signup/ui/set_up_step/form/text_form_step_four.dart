import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/common/widget/text_field_date.dart';
import 'package:roomy/feature/signin_signup/bloc/step_four/bloc_step_four.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';
import 'package:roomy/common/widget/text_field_phone.dart';
import 'package:roomy/common/widget/text_field_about_info.dart';

class TextFormStepFour extends StatefulWidget {
  const TextFormStepFour(
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
  _TextFormStepFourState createState() => _TextFormStepFourState();
}

class _TextFormStepFourState extends State<TextFormStepFour> {
  String _fullNameError;
  String _emailError;
  String _jobError;
  String _phoneError;
  String _birthdayError;
  String _infoMeError;
  String _placeError;
  String _cfPasswordError;
  String _passwordError;

  Widget createErrorWidget(String error) {
    return error != null
        ? AppWidget.textErrorStyle(textError: error)
        : const SizedBox();
  }

  Widget createTextFieldWidget(TextFieldType type, String error) {
    Widget child;
    switch (type) {
      case TextFieldType.birthday:
        child = TextFieldDate(
          controller: widget.controller,
          input: widget.input,
          focusNode: widget.focusNode,
          focusNext: widget.focusNext,
          prefixIcon: widget.prefixIcon,
          colorBorderError:
              error == null ? const Color(0xFFF0F0F0) : const Color(0xFFFC2F39),
        );
        break;
      case TextFieldType.phone:
        child = TextFieldPhone(
          controller: widget.controller,
          input: widget.input,
          focusNode: widget.focusNode,
          focusNext: widget.focusNext,
          suffixIcon: widget.suffixIcon,
          colorBorderError:
              error == null ? const Color(0xFFF0F0F0) : const Color(0xFFFC2F39),
        );
        break;
      case TextFieldType.infoMe:
        child = TextFieldAboutInfo(
          controller: widget.controller,
          input: widget.input,
          prefixIcon: widget.prefixIcon,
          focusNode: widget.focusNode,
          focusNext: widget.focusNext,
          suffixIcon: widget.suffixIcon,
          colorBorderError:
              error == null ? const Color(0xFFF0F0F0) : const Color(0xFFFC2F39),
        );
        break;
      default:
        child = TextFormFieldWidget(
            controller: widget.controller,
            obscureText: widget.obscureText ?? false,
            input: widget.input,
            focusNode: widget.focusNode,
            focusNext: widget.focusNext,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            colorBorderError: error == null
                ? const Color(0xFFF0F0F0)
                : const Color(0xFFFC2F39),
            textInputType: widget.textInputType);
        break;
    }
    return child;
  }

  Widget createTextForm(TextFieldType type) {
    Widget child;
    switch (type) {
      case TextFieldType.fullName:
        child = createTextFieldWidget(type, _fullNameError);
        break;
      case TextFieldType.email:
        child = createTextFieldWidget(type, _emailError);
        break;
      case TextFieldType.password:
        child = createTextFieldWidget(type, _passwordError);
        break;
      case TextFieldType.cfPassword:
        child = createTextFieldWidget(type, _cfPasswordError);
        break;
      case TextFieldType.job:
        child = createTextFieldWidget(type, _jobError);
        break;
      case TextFieldType.place:
        child = createTextFieldWidget(type, _placeError);
        break;
      case TextFieldType.birthday:
        child = createTextFieldWidget(type, _birthdayError);
        break;
      case TextFieldType.phone:
        child = createTextFieldWidget(type, _phoneError);
        break;
      case TextFieldType.infoMe:
        child = createTextFieldWidget(type, _infoMeError);
        break;
      default:
        child = createTextFieldWidget(null, null);
        break;
    }
    return child;
  }

  Widget createWidget(TextFieldType type) {
    Widget child;
    switch (type) {
      case TextFieldType.fullName:
        child = createErrorWidget(_fullNameError);
        break;
      case TextFieldType.email:
        child = createErrorWidget(_emailError);
        break;
      case TextFieldType.password:
        child = createErrorWidget(_passwordError);
        break;
      case TextFieldType.cfPassword:
        child = createErrorWidget(_cfPasswordError);
        break;
      case TextFieldType.job:
        child = createErrorWidget(_jobError);
        break;
      case TextFieldType.place:
        child = createErrorWidget(_placeError);
        break;
      case TextFieldType.birthday:
        child = createErrorWidget(_birthdayError);
        break;
      case TextFieldType.phone:
        child = createErrorWidget(_phoneError);
        break;
      case TextFieldType.infoMe:
        child = createErrorWidget(_infoMeError);
        break;
      default:
        child = createErrorWidget(null);
        break;
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepFourBloc, StepFourState>(
      bloc: BlocProvider.of<StepFourBloc>(context),
      builder: (context, state) {
        if (state is StepFourFailure) {
          _fullNameError = state.errorFullName;
          _passwordError = state.errorPassword;
          _cfPasswordError = state.errorCfPassword;
          _emailError = state.errorEmail;
          _jobError = state.errorJob;
          _placeError = state.errorPlace;
          _phoneError = state.errorPhoneNumber;
          _birthdayError = state.errorBirthday;
          _infoMeError = state.errorInfoMe;
        }
        if (state is StepFourSuccess) {
          _fullNameError = null;
          _passwordError = null;
          _cfPasswordError = null;
          _emailError = null;
          _jobError = null;
          _placeError = null;
          _phoneError = null;
          _birthdayError = null;
          _infoMeError = null;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [createTextForm(widget.type), createWidget(widget.type)],
        );
      },
    );
  }
}
