
import '../../../domain/entity/question_answer_view_entity.dart';
import '../../vo/question_answer_navigation.dart';

abstract class QuestionAnswerState {}

class QuestionAnswerLoadingState extends QuestionAnswerState {}

class QuestionAnswerLoadedState extends QuestionAnswerState {
  final QuestionAnswerViewEntity entity;
  final QuestionAnswerNavigation? navigation;

  QuestionAnswerLoadedState({required this.entity, this.navigation,});
}

class QuestionAnswerLoadErrorState extends QuestionAnswerState {
  final String errorMessage;

  QuestionAnswerLoadErrorState(this.errorMessage);

}