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
  final List<QuestionAnswerModel> questions = [
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

    int indexToUpdate = -1;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].question == param.question) {
        indexToUpdate = i;
        break;
      }
    }

    if (indexToUpdate >= 0) {
      questions[indexToUpdate] = QuestionAnswerModel(
        question: questions[indexToUpdate].question,
        answer: param.answer,
      );
    }
    return Future.value(questions);
  }
}
