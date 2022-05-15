import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/questionnaires/bloc/select_option/bloc_select_option.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/questionnaires/ui/widget/question_widget.dart';

import '../model/answer_model.dart';

class QuestionFive extends StatefulWidget {
  const QuestionFive({this.switchQuestion, this.sampleDataFive, this.height});
  final Function(int) switchQuestion;
  final double height;
  final List<AnswerModel> sampleDataFive;
  @override
  _QuestionFiveState createState() => _QuestionFiveState();
}

class _QuestionFiveState extends State<QuestionFive> {
  List<AnswerModel> listSelected = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionWidget.createTextWidget(input: 'What are you interested in?'),
          BlocBuilder<SelectOptionBloc, SelectOptionState>(
            bloc: BlocProvider.of<SelectOptionBloc>(context),
            builder: (context, state) {
              if (state is ItemSelectedState) {
                listSelected = state.listSelected;
              }
              return Wrap(
                runSpacing: 8,
                spacing: 8,
                children: List.generate(widget.sampleDataFive.length, (index) {
                  return GestureDetector(
                      onTap: () {
                        BlocProvider.of<SelectOptionBloc>(context).add(
                            ItemSelectedEvent(
                                listOption: widget.sampleDataFive,
                                listSelected: listSelected,
                                indexItemSelected: index));
                      },
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 13, left: 13, right: 13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: widget.sampleDataFive[index].isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                              border: Border.all(color: Colors.white),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Color.fromRGBO(0, 0, 0, 0.05),
                                    blurRadius: 5)
                              ]),
                          child: Text(widget.sampleDataFive[index].answer,
                              style: AppWidget.simpleTextFieldStyle(
                                  color: widget.sampleDataFive[index].isSelected
                                      ? const Color(0xFF020433)
                                      : Colors.white,
                                  height: 17.07,
                                  fontSize: 14))));
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
