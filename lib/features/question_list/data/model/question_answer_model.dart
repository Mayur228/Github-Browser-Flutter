import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/question_answer_entity.dart';

part 'question_answer_model.freezed.dart';

@freezed
class QuestionAnswerModel with _$QuestionAnswerModel {

 const factory QuestionAnswerModel({
    required final String question,
    final String? answer,
  }) = _QuestionAnswerModel;
}

extension QuestionAnswerModelMapper on QuestionAnswerModel {
  QuestionAnswerEntity toEntity() {
    return QuestionAnswerEntity(
      question: question,
      answer: answer,
    );
  }
}
