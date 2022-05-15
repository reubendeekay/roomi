class AnswerModel {
  AnswerModel(this.isSelected, this.answer);
  bool isSelected;
  final String answer;

  Map<String, dynamic> toJson() => {
        'isSelected': isSelected,
        'answer': answer,
      };

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        json['isSelected'],
        json['answer'],
      );
}
