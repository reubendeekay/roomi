import 'package:flutter/material.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/common/widget/text_field_date.dart';
import '../set_up_step/widget/custom_slider_one.dart';

class SetUpStepThree extends StatefulWidget {
  const SetUpStepThree({this.switchStep, this.onChanged});
  final Function(String val, String val2) onChanged;

  final Function(int) switchStep;
  @override
  _SetUpStepThreeState createState() => _SetUpStepThreeState();
}

class _SetUpStepThreeState extends State<SetUpStepThree> {
  TextEditingController _dateController;
  FocusNode focusDate;

  @override
  void initState() {
    _dateController = TextEditingController();
    focusDate = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    focusDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SetUpStepWidget.createTitleWidget(
              inputFirst: 'What is your',
              inputLast: 'maximum rent?',
              top: 40,
              bottom: 32,
              left: 24,
              right: 24),
          CustomSliderOne(
            onChanged: (val) {
              setState(() {
                widget.onChanged(val.toString(), _dateController.text);
              });
            },
          ),
          SetUpStepWidget.createTitleWidget(
              inputFirst: 'When is your',
              inputLast: 'move-in date?',
              top: 48,
              bottom: 16,
              left: 24,
              right: 24),
          Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextFieldDate(
                input: 'Move-in Date',
                focusNode: focusDate,
                controller: _dateController,
              )),
        ],
      ),
    );
  }
}
