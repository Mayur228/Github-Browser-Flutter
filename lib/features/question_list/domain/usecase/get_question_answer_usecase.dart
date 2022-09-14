import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/question_list/domain/entity/question_answer_entity.dart';
import 'package:github_browser/features/question_list/domain/repository/question_list_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionAnswerUseCase {
  final QuestionListRepository repository;

  GetQuestionAnswerUseCase(this.repository);
  Future<Resource<List<QuestionAnswerEntity>>> call() {
    return repository.getQuestionList();
  }

}