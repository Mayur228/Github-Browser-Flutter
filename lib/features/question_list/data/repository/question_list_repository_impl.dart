import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/question_list/data/model/question_answer_model.dart';
import 'package:github_browser/features/question_list/data/source/question_list_source.dart';

import 'package:github_browser/features/question_list/domain/entity/question_answer_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/question_list_repository.dart';

@Injectable(as: QuestionListRepository)
class QuestionListRepositoryImpl implements QuestionListRepository {

  final QuestionListSource questionListSource;

  QuestionListRepositoryImpl(this.questionListSource);

  @override
  Future<Resource<List<QuestionAnswerEntity>>> getQuestionList() async {

    try {
      final questions = await questionListSource.getQuestionAnswer();
      return Resource.data(questions.map((e) => e.toEntity()).toList());
    }catch(e) {
      return Resource.error(e);
    }
  }

}