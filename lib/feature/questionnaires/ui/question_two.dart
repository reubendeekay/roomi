import 'package:flutter/material.dart';
import 'package:roomy/feature/questionnaires/ui/widget/question_widget.dart';
import '../model/answer_model.dart';
import '../ui/widget/list_answer_widget.dart';

class QuestionTwo extends StatelessWidget {
  const QuestionTwo({this.switchQuestion, this.height, this.sampleDataTwo});
  final Function(int) switchQuestion;
  final double height;
  final List<AnswerModel> sampleDataTwo;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionWidget.createTextWidget(input: 'Do you smoke?'),
          ListAnswerWidget(
              sampleData: sampleDataTwo,
              switchQuestion: switchQuestion,
              currentQuestion: 3)
        ],
      ),
    );
  }
}
