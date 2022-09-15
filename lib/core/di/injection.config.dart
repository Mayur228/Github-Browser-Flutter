// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/question_list/data/repository/question_list_repository_impl.dart'
    as _i5;
import '../../features/question_list/data/source/question_list_source.dart'
    as _i3;
import '../../features/question_list/domain/repository/question_list_repository.dart'
    as _i4;
import '../../features/question_list/domain/usecase/get_question_answer_usecase.dart'
    as _i7;
import '../../features/question_list/domain/usecase/update_answer_usecase.dart'
    as _i6;
import '../../features/question_list/presentation/state/bloc/question_answer_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.QuestionListSource>(_i3.QuestionListLocalSource());
  gh.factory<_i4.QuestionListRepository>(
      () => _i5.QuestionListRepositoryImpl(get<_i3.QuestionListSource>()));
  gh.factory<_i6.UpdateAnswerUseCase>(
      () => _i6.UpdateAnswerUseCase(get<_i4.QuestionListRepository>()));
  gh.factory<_i7.GetQuestionAnswerUseCase>(
      () => _i7.GetQuestionAnswerUseCase(get<_i4.QuestionListRepository>()));
  gh.factory<_i8.QuestionAnswerBloc>(() => _i8.QuestionAnswerBloc(
      get<_i7.GetQuestionAnswerUseCase>(), get<_i6.UpdateAnswerUseCase>()));
  return get;
}
