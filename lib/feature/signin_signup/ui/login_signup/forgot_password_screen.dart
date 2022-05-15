import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/signin_signup/bloc/forgot_pass/bloc_forgot_pass.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/form/form_forgot_pass.dart';

import 'log_in_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController;
  FocusNode focusEmail;

  @override
  void initState() {
    _emailController = TextEditingController();
    focusEmail = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    focusEmail.dispose();
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
                        input: 'Forgot Password?',
                        color: const Color(0xFF020433)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Please enter your email below to receive your password reset instructions.',
                    style: AppWidget.simpleTextFieldStyle(
                        fontSize: 14,
                        color: const Color(0xFF404B69),
                        height: 24),
                  ),
                ),
                BlocBuilder<ForgotPassBloc, ForgotPassState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 24),
                      child: FormForgotPass(
                        focusNode: focusEmail,
                        input: 'Email',
                        controller: _emailController,
                        type: TextFieldType.email,
                      ),
                    );
                  },
                ),
                BlocListener<ForgotPassBloc, ForgotPassState>(
                  listener: (context, state) {
                    if (state is ForgotPassSuccess) {
                      Navigator.of(context)
                          .pushNamed(Routes.resetPasswordScreen);
                    }
                  },
                  child: GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        BlocProvider.of<ForgotPassBloc>(context).add(
                          ForgotPassButtonPressed(email: _emailController.text),
                        );
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: _emailController.text);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Reset Email sent')));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: AppWidget.typeButtonStartAction(
                            input: 'SEND REQUEST'),
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
