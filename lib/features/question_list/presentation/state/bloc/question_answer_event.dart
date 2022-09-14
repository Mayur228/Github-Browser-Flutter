import '../../../domain/entity/question_answer_entity.dart';

abstract class QuestionAnswerEvent {

}

class LoadQuestionListEvent extends QuestionAnswerEvent {

}

class EnterAnswerEvent extends QuestionAnswerEvent {
  final QuestionAnswerEntity entity;

  EnterAnswerEvent(this.entity);
}