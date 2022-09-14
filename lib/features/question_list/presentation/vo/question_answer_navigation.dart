import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_browser/features/question_list/domain/entity/question_answer_entity.dart';

part 'question_answer_navigation.freezed.dart';

@freezed
class QuestionAnswerNavigation with _$QuestionAnswerNavigation{
  const factory QuestionAnswerNavigation.answerQuestion(QuestionAnswerEntity entity) = _AnswerQuestion;
}