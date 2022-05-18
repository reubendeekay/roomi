import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/common/widget/animation_wave/ripples_animation.dart';
import 'package:roomy/feature/questionnaires/bloc/select_answer/bloc_select_answer.dart';
import 'package:roomy/feature/questionnaires/bloc/select_option/bloc_select_option.dart';
import 'package:roomy/feature/questionnaires/model/answer_model.dart';
import 'package:roomy/feature/questionnaires/ui/question_five.dart';
import 'package:roomy/feature/questionnaires/ui/question_four.dart';
import 'package:roomy/feature/questionnaires/ui/question_three.dart';
import 'package:roomy/feature/questionnaires/ui/question_two.dart';
import 'package:roomy/feature/questionnaires/ui/widget/question_widget.dart';
import 'package:roomy/feature/questionnaires/ui/question_one.dart';
import 'package:roomy/providers/auth_provider.dart';

class QuestionnairesScreen extends StatefulWidget {
  final List<AnswerModel> sampleDataOne = [
    AnswerModel(false, 'I keep thing artsy'),
    AnswerModel(false, 'Once a month'),
    AnswerModel(false, 'Once a week'),
    AnswerModel(false, 'Every few days')
  ];
  final List<AnswerModel> sampleDataTwo = [
    AnswerModel(false, 'Yes'),
    AnswerModel(false, 'No'),
    AnswerModel(false, '420 only')
  ];
  final List<AnswerModel> sampleDataThree = [
    AnswerModel(false, 'No pets. please'),
    AnswerModel(false, 'Depend on the pets'),
    AnswerModel(false, "No pets myself, but i don't mind living with them"),
    AnswerModel(false, 'I live with a pet of my own!')
  ];
  final List<AnswerModel> sampleDataFour = [
    AnswerModel(false, 'No guests, please!'),
    AnswerModel(false, 'Only during the day'),
    AnswerModel(false, 'Overnight it fine')
  ];
  final List<AnswerModel> sampleDataFive = [
    AnswerModel(false, 'Foodie'),
    AnswerModel(false, 'Gym & Sport'),
    AnswerModel(false, 'Party'),
    AnswerModel(false, 'Bookworm'),
    AnswerModel(false, 'Night owl'),
    AnswerModel(false, 'Healthy'),
    AnswerModel(false, 'Travel'),
    AnswerModel(false, 'Culture'),
    AnswerModel(false, 'History')
  ];
  @override
  _QuestionnairesScreenState createState() => _QuestionnairesScreenState();
}

class _QuestionnairesScreenState extends State<QuestionnairesScreen> {
  int _currentQuestion = 1;
  void switchQuestion(int index) {
    setState(() {
      _currentQuestion = index;
    });
  }

  List<AnswerModel> answers = [];

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: QuestionWidget.createAppBarWidget(
            context: context,
            height: height,
            title: 'Question $_currentQuestion-5',
            currentQuestion: _currentQuestion,
            switchQuestion: switchQuestion),
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fill@1x.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 58),
                    child: IndexedStack(
                      index: _currentQuestion - 1,
                      children: [
                        RipplesAnimation(
                          size: width / 75 * 68,
                          color: const Color(0xFF020433),
                          icon: 'images/questionnaires/ic_clean@3x.png',
                          heightIcon: 120,
                          widthIcon: 101.25,
                        ),
                        RipplesAnimation(
                          size: width / 75 * 68,
                          color: const Color(0xFF020433),
                          icon: 'images/questionnaires/ic_smoke@3x.png',
                          heightIcon: 120,
                          widthIcon: 120,
                        ),
                        RipplesAnimation(
                          size: width / 75 * 68,
                          color: const Color(0xFF020433),
                          icon: 'images/questionnaires/ic_pet@3x.png',
                          heightIcon: 120,
                          widthIcon: 119.99,
                        ),
                        RipplesAnimation(
                          size: width / 75 * 68,
                          color: const Color(0xFF020433),
                          icon: 'images/questionnaires/ic_guest@3x.png',
                          heightIcon: 120,
                          widthIcon: 109.88,
                        ),
                        RipplesAnimation(
                          size: width / 75 * 68,
                          color: const Color(0xFF020433),
                          icon: 'images/questionnaires/ic_favorites@3x.png',
                          heightIcon: 120,
                          widthIcon: 119.53,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height / 203 * 90,
                    left: 10,
                    right: 10,
                    child: IndexedStack(
                      index: _currentQuestion - 1,
                      children: [
                        QuestionOne(
                            switchQuestion: switchQuestion,
                            sampleDataOne: widget.sampleDataOne,
                            height: height),
                        QuestionTwo(
                            switchQuestion: switchQuestion,
                            sampleDataTwo: widget.sampleDataTwo,
                            height: height),
                        QuestionThree(
                            switchQuestion: switchQuestion,
                            sampleDataThree: widget.sampleDataThree,
                            height: height),
                        QuestionFour(
                            switchQuestion: switchQuestion,
                            sampleDataFour: widget.sampleDataFour,
                            height: height),
                        QuestionFive(
                            switchQuestion: switchQuestion,
                            sampleDataFive: widget.sampleDataFive,
                            height: height),
                      ],
                    ),
                  ),
                  _currentQuestion == 5
                      ? SafeArea(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white),
                              margin: const EdgeInsets.only(
                                  left: 7, right: 7, bottom: 7),
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Text('DONE',
                                    style: AppWidget.boldTextFieldStyle(
                                        color: const Color(0xFF020433),
                                        fontSize: 14,
                                        height: 17.07,
                                        fontWeight: FontWeight.w500)),
                                onPressed: () async {
                                  final ItemSelectedState options =
                                      BlocProvider.of<SelectOptionBloc>(context)
                                          .state;
                                  final questions = options.listSelected
                                      .map((e) => e.answer)
                                      .toList();

                                  final auth = Provider.of<AuthProvider>(
                                      context,
                                      listen: false);
                                  List questionairres = [
                                    ...auth.questions,
                                  ];
                                  final user = auth.user;

                                  questionairres.add({'attributes': questions});

                                  user.questionnaires = questionairres;
                                  try {
                                    await auth.signUp(user);
                                  } catch (e) {
                                    print(e);
                                  }
                                  Navigator.of(context).pushReplacementNamed(
                                      Routes.questionSuccessScreen);
                                },
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              )),
        ),
      ),
    );
  }
}
