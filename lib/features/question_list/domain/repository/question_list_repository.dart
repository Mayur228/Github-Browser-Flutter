import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/question_list/domain/entity/question_answer_entity.dart';

abstract class QuestionListRepository {
  Future<Resource<List<QuestionAnswerEntity>>> getQuestionList();
}