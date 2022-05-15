import 'package:flutter/material.dart';
import 'package:roomy/feature/questionnaires/ui/widget/list_answer_widget.dart';
import 'package:roomy/feature/questionnaires/ui/widget/question_widget.dart';
import '../model/answer_model.dart';

class QuestionFour extends StatelessWidget {
  const QuestionFour({this.switchQuestion, this.height, this.sampleDataFour});
  final Function(int) switchQuestion;
  final double height;
  final List<AnswerModel> sampleDataFour;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionWidget.createTextWidget(input: 'How about guests?'),
          ListAnswerWidget(
              sampleData: sampleDataFour,
              switchQuestion: switchQuestion,
              currentQuestion: 5)
        ],
      ),
    );
  }
}
