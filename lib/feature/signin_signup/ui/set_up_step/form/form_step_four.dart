import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/segment_control_widget.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';
import 'text_form_step_four.dart';

class FormStepFour extends StatefulWidget {
  const FormStepFour(
      {this.fullNameController,
      this.emailController,
      this.birthdayController,
      this.infoMeController,
      this.cfPasswordController,
      this.jobController,
      this.passwordController,
      this.phoneController,
      this.placeController});
  final TextEditingController birthdayController;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController cfPasswordController;
  final TextEditingController jobController;
  final TextEditingController placeController;
  final TextEditingController infoMeController;
  @override
  _FormStepFourState createState() => _FormStepFourState();
}

class _FormStepFourState extends State<FormStepFour> {
  FocusNode focusFullName = FocusNode();
  FocusNode focusBirthday = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusConfirmPass = FocusNode();
  FocusNode focusJob = FocusNode();
  FocusNode focusPlace = FocusNode();
  FocusNode focusAbout = FocusNode();

  @override
  void dispose() {
    focusFullName.dispose();
    focusBirthday.dispose();
    focusPhone.dispose();
    focusEmail.dispose();
    focusPassword.dispose();
    focusConfirmPass.dispose();
    focusJob.dispose();
    focusPlace.dispose();
    focusAbout.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = AppWidget.getWidthScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormStepFour(
          input: 'Full Name',
          type: TextFieldType.fullName,
          controller: widget.fullNameController,
          focusNode: focusFullName,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 17),
          child: Text(
            'Gender',
            style: AppWidget.simpleTextFieldStyle(
                height: 15.85, fontSize: 13, color: const Color(0xFF020433)),
          ),
        ),
        SegmentControlWidget(
          width: width,
          listLabel: const ['Male', 'Female', 'Others'],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextFormStepFour(
              input: 'Your Birthday',
              type: TextFieldType.birthday,
              controller: widget.birthdayController,
              focusNode: focusBirthday,
              focusNext: focusPhone),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextFormStepFour(
              input: 'Phone Number',
              type: TextFieldType.phone,
              controller: widget.phoneController,
              focusNode: focusPhone,
              focusNext: focusEmail),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextFormStepFour(
              input: 'Email',
              type: TextFieldType.email,
              controller: widget.emailController,
              focusNode: focusEmail,
              focusNext: focusPassword,
              textInputType: TextInputType.emailAddress),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextFormStepFour(
              input: 'Password',
              controller: widget.passwordController,
              type: TextFieldType.password,
              obscureText: true,
              focusNode: focusPassword,
              focusNext: focusConfirmPass),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextFormStepFour(
              input: 'Confirm Password',
              type: TextFieldType.cfPassword,
              controller: widget.cfPasswordController,
              obscureText: true,
              focusNode: focusConfirmPass,
              focusNext: focusJob),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextFormStepFour(
              input: 'What do you do?',
              type: TextFieldType.job,
              controller: widget.jobController,
              focusNode: focusJob,
              focusNext: focusPlace),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextFormStepFour(
              input: 'Where do you work?',
              type: TextFieldType.place,
              controller: widget.placeController,
              focusNode: focusPlace,
              focusNext: focusAbout),
        ),
        TextFormStepFour(
          focusNode: focusAbout,
          type: TextFieldType.infoMe,
          controller: widget.infoMeController,
          input: 'About me',
        ),
      ],
    );
  }
}
