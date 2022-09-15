import 'package:github_browser/features/question_list/data/model/question_answer_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/question_answer_entity.dart';
import '../../presentation/vo/answer_param.dart';

abstract class QuestionListSource {
  Future<List<QuestionAnswerModel>> getQuestionAnswer();

  Future<List<QuestionAnswerModel>> updateAnswer(AnswerParam param);
}

@Singleton(as: QuestionListSource)
class QuestionListLocalSource implements QuestionListSource {
  List<QuestionAnswerModel> questions = [
    QuestionAnswerModel(question: "What is your name?"),
    QuestionAnswerModel(question: "What is your favourite color?"),
    QuestionAnswerModel(question: "What is your favourite fruit?"),
  ];

  @override
  Future<List<QuestionAnswerModel>> getQuestionAnswer() {
    return Future.value(questions);
  }

  @override
  Future<List<QuestionAnswerModel>> updateAnswer(AnswerParam param) {
    List<QuestionAnswerModel> newList = [];
    for (var element in questions) {
      if (element.question == param.question) {
        newList.add(element.copyWith(answer: param.answer));
      } else {
        newList.add(element);
      }
    }
    questions = newList;
    return Future.value(newList);
  }
}
