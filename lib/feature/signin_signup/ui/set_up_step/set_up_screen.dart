import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/landlord_mode_post_room/widget/landlord_mode_widget.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/signin_signup/bloc/step_four/bloc_step_four.dart';
import 'package:roomy/feature/signin_signup/bloc/step_five/bloc_step_five.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/providers/auth_provider.dart';

import '../set_up_step/widget/set_up_step_widget.dart';
import 'set_up_step_five.dart';
import 'set_up_step_four.dart';
import 'set_up_step_one.dart';
import 'set_up_step_three.dart';
import 'set_up_step_two.dart';

class SetUpScreen extends StatefulWidget {
  @override
  _SetUpScreenState createState() => _SetUpScreenState();
}

class _SetUpScreenState extends State<SetUpScreen> {
  TextEditingController birthdayController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cfPasswordController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController infoMeController = TextEditingController();
  String lookingFor;
  String maxRent;
  String moveInDate;
  String goingTo;

  int checkInputFour = 4;
  bool checkState = false;
  int count = 0;

  int _currentStep = 1;
  void switchStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    birthdayController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cfPasswordController.dispose();
    jobController.dispose();
    placeController.dispose();
    infoMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: SetUpStepWidget.createAppBarWidget(
          context: context,
          height: height,
          title: 'Step $_currentStep-5',
          currentStep: _currentStep,
          switchStep: switchStep),
      body: IndexedStack(
        index: _currentStep - 1,
        children: [
          SetUpStepOne(
            switchStep: switchStep,
            onChanged: (val) {
              setState(() {
                lookingFor = val;
              });
            },
          ),
          SetUpStepTwo(
            switchStep: switchStep,
            onChanged: (val) {
              setState(() {
                goingTo = val;
              });
            },
          ),
          SetUpStepThree(
              switchStep: switchStep,
              onChanged: (val, val2) {
                setState(() {
                  maxRent = val;
                  moveInDate = val2;
                });
              }),
          SetUpStepFour(
            switchStep: switchStep,
            fullNameController: fullNameController,
            birthdayController: birthdayController,
            emailController: emailController,
            infoMeController: infoMeController,
            jobController: jobController,
            cfPasswordController: cfPasswordController,
            passwordController: passwordController,
            phoneController: phoneController,
            placeController: placeController,
          ),
          SetUpStepFive(
            switchStep: switchStep,
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: _currentStep - 1 != 0 ? (_currentStep - 1 != 1 ? 66 : 0) : 0,
          child: IndexedStack(
            index: _currentStep - 1,
            children: [
              const SizedBox(),
              const SizedBox(),
              LandlordModeWidget.createContainerNav(
                  input: 'NEXT',
                  switchStep: switchStep,
                  step: 4,
                  hasShadow: true),
              Container(
                height: 66,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(2, 4, 51, 0.08),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ]),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 4),
                child: BlocListener<StepFourBloc, StepFourState>(
                  listener: (context, state) async {
                    if (state is StepFourSuccess) {
                      checkInputFour = 5;
                    }
                  },
                  child: GestureDetector(
                      onTap: () {
                        count++;
                        if (count < 1) {
                          print(count);
                        } else {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (checkInputFour == 4) {
                            BlocProvider.of<StepFourBloc>(context).add(
                                StepFourButtonPressed(
                                    name: fullNameController.text,
                                    email: emailController.text,
                                    infoMe: infoMeController.text,
                                    job: jobController.text,
                                    place: placeController.text,
                                    password: passwordController.text,
                                    cfPassword: cfPasswordController.text,
                                    birthday: birthdayController.text,
                                    phone: phoneController.text));
                          } else if (checkInputFour == 5) {
                            switchStep(5);
                          }
                        }
                      },
                      child: AppWidget.typeButtonStartAction(input: 'NEXT')),
                ),
              ),
              Container(
                height: 66,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(2, 4, 51, 0.08),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ]),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 4),
                child: BlocListener<StepFiveBloc, StepFiveState>(
                  listener: (context, state) {
                    if (state is StepFiveSuccess) {
                      checkState = true;
                    }
                  },
                  child: GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (checkState) {
                          final user = UserModel(
                            aboutUser: infoMeController.text,
                            dateOfBirth: birthdayController.text,
                            createdAt: Timestamp.now(),
                            email: emailController.text,
                            gender: true,
                            isAdmin: true,
                            occupation: jobController.text,
                            maxRent: maxRent,
                            workPlace: placeController.text,
                            prefferedLocation: goingTo,
                            age: 2022 -
                                int.parse(
                                    birthdayController.text.split(',')[1]),
                            imgAvt:
                                'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                            isLandlord: lookingFor == 'tenant' ? true : false,
                            name: fullNameController.text,
                            password: passwordController.text,
                            phoneNumber: phoneController.text,
                            type: lookingFor,
                          );
                          Provider.of<AuthProvider>(context, listen: false)
                              .setUser(user);
                          if (user.isAdmin) {
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .signUp(user);
                          }
                          Navigator.of(context)
                              .pushNamed(Routes.setUpSuccessScreen);
                          checkState = false;
                        } else {
                          print('false');
                        }
                      },
                      child: AppWidget.typeButtonStartAction(input: 'DONE')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
