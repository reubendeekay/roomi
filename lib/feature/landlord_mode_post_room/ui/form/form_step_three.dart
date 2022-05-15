import 'package:flutter/material.dart';
import 'package:roomy/common/widget/text_form_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/landlord_mode_post_room/bloc/roommate_preference/bloc_roommate_preference.dart';
import 'text_field_step_three.dart';

class FormStepThree extends StatefulWidget {
  const FormStepThree(
      {this.rentController, this.depositController, this.dateController});
  final TextEditingController dateController;
  final TextEditingController rentController;
  final TextEditingController depositController;
  @override
  _FormStepThreeState createState() => _FormStepThreeState();
}

class _FormStepThreeState extends State<FormStepThree> {
  FocusNode focusRent = FocusNode();
  FocusNode focusDeposit = FocusNode();
  FocusNode focusAvailable = FocusNode();

  @override
  void dispose() {
    focusRent.dispose();
    focusDeposit.dispose();
    focusAvailable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoommatePrfBloc, RoommatePrfState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: TextFieldStepThree(
                input: 'Rent per month (KES)',
                controller: widget.rentController,
                type: TextFieldType.rent,
                textInputType: TextInputType.number,
                focusNode: focusRent,
                focusNext: focusDeposit,
              ),
            ),
            TextFieldStepThree(
              input: 'Deposit (KES)',
              controller: widget.depositController,
              type: TextFieldType.deposit,
              textInputType: TextInputType.number,
              focusNode: focusDeposit,
              focusNext: focusAvailable,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: TextFieldStepThree(
                  input: 'Available from',
                  controller: widget.dateController,
                  type: TextFieldType.available,
                  focusNode: focusAvailable),
            ),
          ],
        );
      },
    );
  }
}
