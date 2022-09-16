
class QuestionAnswerEntity {
  final String question;
  final String? answer;

  QuestionAnswerEntity({
    required this.question,
    this.answer,
  });

  @override
  bool operator ==(Object other) {
    return other is QuestionAnswerEntity && other.question == question && other.answer == answer;
  }

  @override
  int get hashCode => Object.hash(question, answer);

}
