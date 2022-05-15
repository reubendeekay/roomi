import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';

import '../../bloc/reset_pass/bloc_reset_pass.dart';
import 'form/form_reset_pass.dart';
import 'log_in_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _codeController;
  TextEditingController _passwordController;
  TextEditingController _cfPasswordController;
  FocusNode focusCode;
  FocusNode focusPassword;
  FocusNode focusConfirmPassword;

  @override
  void initState() {
    _codeController = TextEditingController();
    _passwordController = TextEditingController();
    _cfPasswordController = TextEditingController();
    focusCode = FocusNode();
    focusPassword = FocusNode();
    focusConfirmPassword = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _passwordController.dispose();
    _cfPasswordController.dispose();
    focusCode.dispose();
    focusPassword.dispose();
    focusConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: LogInWidget.createAppBarWidget(context: context, height: height),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 16),
                    child: LogInWidget.createTextWidget(
                        input: 'Reset Password',
                        color: const Color(0xFF020433)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Reset code was sent to your email. Please enter the code and create new password.',
                    style: AppWidget.simpleTextFieldStyle(
                        fontSize: 14,
                        color: const Color(0xFF404B69),
                        height: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 24),
                  child: Column(
                    children: [
                      FormResetPass(
                        input: 'Reset Code',
                        focusNode: focusCode,
                        focusNext: focusPassword,
                        controller: _codeController,
                        type: TextFieldType.code,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: FormResetPass(
                          input: 'New Password',
                          focusNode: focusPassword,
                          focusNext: focusConfirmPassword,
                          controller: _passwordController,
                          type: TextFieldType.password,
                          obscureText: true,
                        ),
                      ),
                      FormResetPass(
                          input: 'Confirm Password',
                          focusNode: focusConfirmPassword,
                          controller: _cfPasswordController,
                          type: TextFieldType.cfPassword,
                          obscureText: true),
                    ],
                  ),
                ),
                BlocListener<ResetPassBloc, ResetPassState>(
                  listener: (context, state) async {
                    if (state is ResetPassSuccess) {
                      await showDialog<dynamic>(
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(seconds: 5), () {
                            Navigator.of(context).pop(true);
                          });
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        },
                      );
                      Navigator.of(context)
                          .pushNamed(Routes.resetSuccessScreen);
                    }
                  },
                  child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        BlocProvider.of<ResetPassBloc>(context).add(
                            ResetPassButtonPressed(
                                code: _codeController.text,
                                password: _passwordController.text,
                                cfPassword: _cfPasswordController.text));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: AppWidget.typeButtonStartAction(
                            input: 'CHANGE PASSWORD'),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
