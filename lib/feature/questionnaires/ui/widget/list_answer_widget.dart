import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/feature/questionnaires/model/answer_model.dart';
import 'package:roomy/feature/questionnaires/ui/widget/question_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/questionnaires/bloc/select_answer/bloc_select_answer.dart';
import 'package:roomy/providers/auth_provider.dart';

class ListAnswerWidget extends StatelessWidget {
  const ListAnswerWidget(
      {this.sampleData, this.switchQuestion, this.currentQuestion});
  final List<AnswerModel> sampleData;
  final Function(int) switchQuestion;
  final int currentQuestion;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectAnswerBloc, SelectAnswerState>(
      bloc: BlocProvider.of<SelectAnswerBloc>(context),
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.only(top: 0),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 16);
          },
          itemCount: sampleData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () async {
                  BlocProvider.of<SelectAnswerBloc>(context).add(
                    ItemAnswerSelected(
                        answerModel: sampleData, indexItemSelected: index),
                  );

                  Provider.of<AuthProvider>(context, listen: false)
                      .questions
                      .add(sampleData[index].answer);
                  await Future.delayed(const Duration(milliseconds: 500), () {
                    switchQuestion(currentQuestion);
                  });
                },
                child:
                    QuestionWidget.createRadio(answerModel: sampleData[index]));
          },
        );
      },
    );
  }
}
