import 'package:github_browser/features/question_list/data/model/question_answer_model.dart';
import 'package:injectable/injectable.dart';

abstract class QuestionListSource {
  Future<List<QuestionAnswerModel>> getQuestionAnswer();
}

@Singleton(as: QuestionListSource)
class QuestionListLocalSource implements QuestionListSource {

  final List<QuestionAnswerModel> questions = [
    QuestionAnswerModel(question: "What is your name?"),
    QuestionAnswerModel(question: "What is your favourite color?"),
    QuestionAnswerModel(question: "What is your favourite fruit?"),
  ];


  @override
  Future<List<QuestionAnswerModel>> getQuestionAnswer() {
   return Future.value(questions);
  }

}