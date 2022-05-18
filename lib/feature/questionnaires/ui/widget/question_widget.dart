import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import '../../model/answer_model.dart';

mixin QuestionWidget {
  static Widget createAppBarWidget(
      {BuildContext context,
      double height,
      String title,
      int currentQuestion,
      Function(int) switchQuestion}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 203 * 12),
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        brightness: Brightness.light,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (currentQuestion == null || currentQuestion - 1 == 0) {
                    Navigator.of(context).pop();
                  } else {
                    switchQuestion(currentQuestion - 1);
                  }
                },
                child: Image.asset(
                  'images/log_in/ic_back@3x.png',
                  height: 18,
                  width: 22,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
        elevation: 0,
        title: Text(
          title,
          style: AppWidget.boldTextFieldStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 19.5),
        ),
      ),
    );
  }

  static Widget createTextWidget({String input}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          input,
          textAlign: TextAlign.center,
          style: AppWidget.boldTextFieldStyle(
              height: 24,
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  static Widget createRadio({AnswerModel answerModel}) {
    return Container(
      height: 56,
      width: 311,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: answerModel.isSelected
                      ? const Color(0xFF0F73EE)
                      : const Color(0xFFF0F0F0)),
            ),
            Expanded(
              child: Text(
                answerModel.answer,
                style: AppWidget.simpleTextFieldStyle(
                    color: const Color(0xFF020433),
                    fontSize: 14,
                    height: 17.07),
              ),
            )
          ],
        ),
      ),
    );
  }
}
