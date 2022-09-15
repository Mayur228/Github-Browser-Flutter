import '../../../domain/entity/question_answer_entity.dart';
import '../../vo/answer_param.dart';

abstract class QuestionAnswerEvent {

}

class LoadQuestionListEvent extends QuestionAnswerEvent {

}

class EnterAnswerEvent extends QuestionAnswerEvent {
  final QuestionAnswerEntity entity;

  EnterAnswerEvent(this.entity);
}

class UpdateQuestionListEvent extends QuestionAnswerEvent {
  final AnswerParam answerParam;

  UpdateQuestionListEvent(this.answerParam);
}