import 'package:github_browser/core/util/resource.dart';
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
    final entityList = await questionListSource.getQuestionAnswer().then((value) => value.map((e) => QuestionAnswerEntity(question: e.question,answer: e.answer)).toList());
    return Future.value(Resource(data: entityList));
  }

}