import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/constant/env.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';
import 'package:roomy/common/widget/web_view_privacy.dart';
import 'package:roomy/feature/signin_signup/bloc/sign_in/bloc_signin.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/tenant_mode_screen.dart';
import 'package:roomy/providers/auth_provider.dart';

import '../login_signup/form/form_login.dart';
import 'log_in_widget.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  FocusNode focusEmail;
  FocusNode focusPassword;
  bool isChecked = false;

  Widget createPrivacy({BuildContext context, String input, String url}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.webViewPrivacy,
            arguments: WebViewPrivacy(
              title: input,
              url: url,
            ));
      },
      child: Text(
        input,
        style: AppWidget.simpleTextFieldStyle(
            height: 18, fontSize: 14, color: Colors.blue),
      ),
    );
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    focusEmail = FocusNode();
    focusPassword = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    focusEmail.dispose();
    focusPassword.dispose();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SetUpStepWidget.createTitleWidget(
                      inputFirst: 'Hi,',
                      inputLast: 'Welcome back !',
                      top: 20,
                      bottom: 40),
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        FormLogin(
                          controller: _emailController,
                          focusNode: focusEmail,
                          focusNext: focusPassword,
                          type: TextFieldType.email,
                          input: 'Email',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: FormLogin(
                            controller: _passwordController,
                            focusNode: focusPassword,
                            type: TextFieldType.password,
                            input: 'Password',
                            obscureText: true,
                          ),
                        )
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 25),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.forgotPasswordScreen);
                      },
                      child: FittedBox(
                        child: Text(
                          'Forgot Password?',
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF404B69),
                              fontSize: 14,
                              height: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: Colors.blue,
                      value: isChecked,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      onChanged: (bool value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'I agree to the ',
                          style: AppWidget.simpleTextFieldStyle(
                              height: 18, fontSize: 14, color: Colors.black),
                        ),
                        createPrivacy(
                            context: context,
                            input: 'Policy',
                            url: EnvValue.policy),
                        Text(
                          ' and ',
                          style: AppWidget.simpleTextFieldStyle(
                              height: 18, fontSize: 14, color: Colors.black),
                        ),
                        createPrivacy(
                            context: context,
                            input: 'Terms',
                            url: EnvValue.terms),
                      ],
                    ),
                  ],
                ),
                BlocListener<SignInBloc, SignInState>(
                  listener: (context, state) async {
                    if (state is SignInSuccess) {
                      try {
                        await Provider.of<AuthProvider>(context, listen: false)
                            .signIn(_emailController.text.trim(),
                                _passwordController.text.trim());
                        Get.off(() => TenantModeScreen());
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: GestureDetector(
                      onTap: isChecked
                          ? () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              BlocProvider.of<SignInBloc>(context).add(
                                SignInButtonPressed(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          : () {},
                      child: AppWidget.typeButtonStartAction(input: 'LOG IN')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 33, left: 1),
                  child: LogInWidget.createRichTextWidget(
                      inputFirst: 'New!',
                      colorFirst: const Color(0xFFFF4949),
                      inputLast: ' Quick login use FaceID',
                      colorLast: const Color(0xFF020433),
                      height: 17,
                      fontSize: 14),
                ),
                Image.asset(
                  'images/log_in/ic_faceid@3x.png',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 125),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.setUpScreen);
                    },
                    child: LogInWidget.createRichTextWidget(
                        inputFirst: "Don't have Roomy account?",
                        colorFirst: const Color(0xFF020433),
                        inputLast: ' Sign up',
                        colorLast: Colors.blue,
                        height: 17,
                        fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
