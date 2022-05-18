import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/step_four_widget.dart';
import 'package:roomy/common/widget/text_field_about_info.dart';
import 'package:roomy/providers/post_provider.dart';
import 'package:file_picker/file_picker.dart';

class AddPhotoStep extends StatefulWidget {
  const AddPhotoStep();

  @override
  _AddPhotoStepState createState() => _AddPhotoStepState();
}

class _AddPhotoStepState extends State<AddPhotoStep> {
  List<String> listImage = [
    'images/log_in/btn_add_image@3x.png',
    'images/landlord_mode/img_landlord_mode@3x.png',
    'images/tenant_mode/img_roommate_2@3x.png'
  ];

  FocusNode desNode = FocusNode();
  FocusNode titNode = FocusNode();
  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final post = Provider.of<PostProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SetUpStepWidget.createTitleWidget(
                inputFirst: 'About',
                inputLast: 'Your Room',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: TextFieldAboutInfo(
                  input: 'Title',
                  onChanged: (val) {
                    post.title = val;
                    print(post.title);
                  },
                  focusNode: titNode),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: TextFieldAboutInfo(
                  input: 'Description',
                  onChanged: (val) {
                    post.description = val;
                    print(post.description);
                  },
                  focusNode: desNode),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                'Please enter a description to get the best possible response to your listing. '
                "Tell other users what you love about the property; what's great about the room, "
                'the location and any current roommates.',
                style: AppWidget.simpleTextFieldStyle(
                    color: const Color(0xFF95A0B6), height: 18, fontSize: 12),
              ),
            ),
            StepFourWidget.createRichTextWidget(
                inputFirst: 'Your Photos',
                inputLast: ' (Max 5 photos)',
                colorFirst: const Color(0xFF020433),
                colorLast: const Color(0xFFFC2F39),
                sizeFirst: 14,
                sizeLast: 12,
                heightFirst: 17.07,
                heightLast: 14.63),
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
                            FilePickerResult result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);

                            if (result != null) {
                              List<File> files = result.paths
                                  .map((path) => File(path))
                                  .toList();
                              setState(() {
                                imageFiles = files;
                                post.imageFiles = files;
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
            Text(
              'Photos are the most important thing for any potential roommates!'
              ' Upload up to 10 pictures and make your property stand out.',
              style: AppWidget.simpleTextFieldStyle(
                  color: const Color(0xFF95A0B6), height: 18, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
