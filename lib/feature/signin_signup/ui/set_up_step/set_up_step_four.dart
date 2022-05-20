import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/providers/auth_provider.dart';

import '../set_up_step/form/form_step_four.dart';
import '../set_up_step/widget/step_four_widget.dart';
import 'widget/set_up_step_widget.dart';

class SetUpStepFour extends StatefulWidget {
  SetUpStepFour(
      {this.switchStep,
      this.fullNameController,
      this.emailController,
      this.birthdayController,
      this.infoMeController,
      this.cfPasswordController,
      this.jobController,
      this.passwordController,
      this.onImageSelected,
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
  final Function(int) switchStep;
  final Function(File) onImageSelected;

  @override
  State<SetUpStepFour> createState() => _SetUpStepFourState();
}

class _SetUpStepFourState extends State<SetUpStepFour> {
  final List<String> listImage = [
    'images/log_in/btn_add_image@3x.png',
    'images/log_in/img_2_step_4@3x.png',
    'images/log_in/img_3_step_4@3x.png'
  ];

  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    final double width = AppWidget.getWidthScreen(context);
    final user = Provider.of<AuthProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SetUpStepWidget.createTitleWidget(
                  inputFirst: 'Create',
                  inputLast: 'Your Profile',
                  top: 40,
                  bottom: 32),
              FormStepFour(
                fullNameController: widget.fullNameController,
                birthdayController: widget.birthdayController,
                emailController: widget.emailController,
                infoMeController: widget.infoMeController,
                jobController: widget.jobController,
                cfPasswordController: widget.cfPasswordController,
                passwordController: widget.passwordController,
                phoneController: widget.phoneController,
                placeController: widget.placeController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: StepFourWidget.createRichTextWidget(
                    inputFirst: 'Your Photos',
                    inputLast: ' (Max 2 photos)',
                    colorFirst: const Color(0xFF020433),
                    colorLast: const Color(0xFFFC2F39),
                    sizeFirst: 14,
                    sizeLast: 12,
                    heightFirst: 17.07,
                    heightLast: 14.63),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17, bottom: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: width * 3 / height,
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: imageFiles.length + 1,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? InkWell(
                            onTap: () async {
                              FilePickerResult result =
                                  await FilePicker.platform.pickFiles();

                              if (result != null) {
                                List<File> files = result.paths
                                    .map((path) => File(path))
                                    .toList();
                                setState(() {
                                  imageFiles = files;
                                  widget.onImageSelected(files.first);
                                });
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Image.asset(
                              listImage[index],
                              fit: BoxFit.fill,
                            ),
                          )
                        : Image.file(
                            imageFiles[index - 1],
                            fit: BoxFit.fill,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
