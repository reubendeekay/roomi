import 'package:flutter/material.dart';
import 'package:roomy/feature/questionnaires/ui/widget/list_answer_widget.dart';
import 'package:roomy/feature/questionnaires/ui/widget/question_widget.dart';
import '../model/answer_model.dart';

class QuestionThree extends StatelessWidget {
  const QuestionThree({this.switchQuestion, this.height, this.sampleDataThree});
  final Function(int) switchQuestion;
  final double height;
  final List<AnswerModel> sampleDataThree;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionWidget.createTextWidget(input: 'How do you feel about pets?'),
          ListAnswerWidget(
              sampleData: sampleDataThree,
              switchQuestion: switchQuestion,
              currentQuestion: 4)
        ],
      ),
    );
  }
}
