import 'package:flutter/material.dart';
import 'package:roomy/feature/questionnaires/ui/widget/list_answer_widget.dart';
import 'package:roomy/feature/questionnaires/ui/widget/question_widget.dart';
import '../model/answer_model.dart';

class QuestionOne extends StatelessWidget {
  const QuestionOne({this.switchQuestion, this.height, this.sampleDataOne});
  final Function(int) switchQuestion;
  final double height;
  final List<AnswerModel> sampleDataOne;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionWidget.createTextWidget(
              input: 'How often do you clean your apartment?'),
          ListAnswerWidget(
              sampleData: sampleDataOne,
              switchQuestion: switchQuestion,
              currentQuestion: 2)
        ],
      ),
    );
  }
}
