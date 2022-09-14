import 'package:github_browser/features/question_list/domain/entity/question_answer_entity.dart';

class QuestionAnswerModel {
  final String question;
  final String? answer;

  QuestionAnswerModel({
    required this.question,
    this.answer,
  });
}

extension QuestionAnswerModelMapper on QuestionAnswerModel {
  QuestionAnswerEntity toEntity() {
    return QuestionAnswerEntity(
      question: question,
      answer: answer,
    );
  }
}
