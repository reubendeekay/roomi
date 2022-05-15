import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/common/widget/text_field_date.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';
import 'package:roomy/feature/landlord_mode_post_room/bloc/roommate_preference/bloc_roommate_preference.dart';

class TextFieldStepThree extends StatefulWidget {
  const TextFieldStepThree(
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
  _TextFieldStepThreeState createState() => _TextFieldStepThreeState();
}

class _TextFieldStepThreeState extends State<TextFieldStepThree> {
  String _rentError;
  String _depositError;
  String _availableError;

  Widget createErrorWidget(String error) {
    return error != null
        ? AppWidget.textErrorStyle(textError: error)
        : const SizedBox();
  }

  Widget createTextFieldWidget(TextFieldType type, String error) {
    Widget child;
    switch (type) {
      case TextFieldType.available:
        child = TextFieldDate(
            controller: widget.controller,
            input: widget.input,
            focusNode: widget.focusNode,
            focusNext: widget.focusNext,
            colorBorderError: error == null
                ? const Color(0xFFF0F0F0)
                : const Color(0xFFFC2F39),
            prefixIcon: widget.prefixIcon);
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
      case TextFieldType.available:
        child = createTextFieldWidget(type, _availableError);
        break;
      case TextFieldType.rent:
        child = createTextFieldWidget(type, _rentError);
        break;
      case TextFieldType.deposit:
        child = createTextFieldWidget(type, _depositError);
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
      case TextFieldType.rent:
        child = createErrorWidget(_rentError);
        break;
      case TextFieldType.deposit:
        child = createErrorWidget(_depositError);
        break;
      case TextFieldType.available:
        child = createErrorWidget(_availableError);
        break;
      default:
        child = createErrorWidget(null);
        break;
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoommatePrfBloc, RoommatePrfState>(
      bloc: BlocProvider.of<RoommatePrfBloc>(context),
      builder: (context, state) {
        if (state is RoommatePrfFailure) {
          _rentError = state.errorRent;
          _depositError = state.errorDeposit;
          _availableError = state.errorAvailable;
        }
        if (state is RoommatePrfSuccess) {
          _rentError = null;
          _depositError = null;
          _availableError = null;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [createTextForm(widget.type), createWidget(widget.type)],
        );
      },
    );
  }
}
