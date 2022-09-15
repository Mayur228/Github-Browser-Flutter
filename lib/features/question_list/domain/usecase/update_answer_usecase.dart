import 'package:github_browser/core/util/resource.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/vo/answer_param.dart';
import '../entity/question_answer_entity.dart';
import '../repository/question_list_repository.dart';

@injectable
class UpdateAnswerUseCase {
  final QuestionListRepository repository;

  UpdateAnswerUseCase(this.repository);

  Future<Resource<List<QuestionAnswerEntity>>> call(AnswerParam param) {
    return repository.updateAnswer(param);
  }
}