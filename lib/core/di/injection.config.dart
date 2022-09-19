// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/branchscreen/data/repository/branch_repository.dart'
    as _i18;
import '../../features/branchscreen/data/source/branch_source.dart' as _i5;
import '../../features/branchscreen/domain/repository/branch_repository.dart'
    as _i17;
import '../../features/branchscreen/domain/usecase/get_branch.dart' as _i19;
import '../../features/branchscreen/presentation/bloc/branch_bloc.dart' as _i25;
import '../../features/homescreen/domain/usecase/get_bookmarked_usecase.dart'
    as _i6;
import '../../features/homescreen/presentation/bloc/home_bloc.dart' as _i7;
import '../../features/question_list/data/repository/question_list_repository_impl.dart'
    as _i21;
import '../../features/question_list/data/source/question_list_source.dart'
    as _i8;
import '../../features/question_list/domain/repository/question_list_repository.dart'
    as _i20;
import '../../features/question_list/domain/usecase/get_question_answer_usecase.dart'
    as _i26;
import '../../features/question_list/domain/usecase/update_answer_usecase.dart'
    as _i24;
import '../../features/question_list/presentation/state/bloc/question_answer_bloc.dart'
    as _i27;
import '../../features/search_repository/data/repository/search_repo_repository.dart'
    as _i11;
import '../../features/search_repository/data/source/search_repository_source.dart'
    as _i12;
import '../../features/search_repository/domain/repository/search_repo_repository.dart'
    as _i10;
import '../../features/search_repository/domain/usecase/search_reposirory_usecase.dart'
    as _i13;
import '../../features/search_repository/presentaition/bloc/search_repository_bloc.dart'
    as _i22;
import '../../features/searched_repository/data/repository/search_repo_repository.dart'
    as _i15;
import '../../features/searched_repository/data/source/repository_source.dart'
    as _i9;
import '../../features/searched_repository/domain/repository/search_repo_repository.dart'
    as _i14;
import '../../features/searched_repository/domain/usecase/add_to_bookmark_usecase.dart'
    as _i3;
import '../../features/searched_repository/domain/usecase/searching_repository_usecase.dart'
    as _i16;
import '../../features/searched_repository/presentation/bloc/searched_repository_bloc.dart'
    as _i23;
import '../util/api_source.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddToBookmarkUseCase>(() => _i3.AddToBookmarkUseCase());
  gh.factory<_i4.ApiSource>(() => _i4.ApiSource());
  gh.singleton<_i5.BranchSource>(_i5.BranchSourceImp(get<_i4.ApiSource>()));
  gh.factory<_i6.GetBookmarkedUseCase>(() => _i6.GetBookmarkedUseCase());
  gh.factory<_i7.HomeBloc>(
      () => _i7.HomeBloc(bookmarked: get<_i6.GetBookmarkedUseCase>()));
  gh.singleton<_i8.QuestionListSource>(_i8.QuestionListLocalSource());
  gh.singleton<_i9.RepositorySource>(
      _i9.RepositorySourceImpl(get<_i4.ApiSource>()));
  gh.factory<_i10.SearchRepoRepository>(() => _i11.SearchRepoRepositoryImpl());
  gh.singleton<_i12.SearchRepositorySource>(
      _i12.SearchRepositorySourceImpl(get<_i4.ApiSource>()));
  gh.factory<_i13.SearchRepositoryUseCase>(
      () => _i13.SearchRepositoryUseCase(get<_i10.SearchRepoRepository>()));
  gh.factory<_i14.SearchedRepoRepository>(
      () => _i15.SearchedRepoRepositoryImpl(get<_i9.RepositorySource>()));
  gh.factory<_i16.SearchedRepositoryUseCase>(
      () => _i16.SearchedRepositoryUseCase(get<_i14.SearchedRepoRepository>()));
  gh.factory<_i17.BranchRepository>(
      () => _i18.BranchRepositoryImpl(get<_i5.BranchSource>()));
  gh.factory<_i19.GetBranchUseCase>(
      () => _i19.GetBranchUseCase(get<_i17.BranchRepository>()));
  gh.factory<_i20.QuestionListRepository>(
      () => _i21.QuestionListRepositoryImpl(get<_i8.QuestionListSource>()));
  gh.factory<_i22.SearchRepositoryBloc>(
      () => _i22.SearchRepositoryBloc(get<_i13.SearchRepositoryUseCase>()));
  gh.factory<_i23.SearchedRepositoryBloc>(() => _i23.SearchedRepositoryBloc(
      useCase: get<_i19.GetBranchUseCase>(),
      addToBookmark: get<_i3.AddToBookmarkUseCase>(),
      searchedRepository: get<_i16.SearchedRepositoryUseCase>()));
  gh.factory<_i24.UpdateAnswerUseCase>(
      () => _i24.UpdateAnswerUseCase(get<_i20.QuestionListRepository>()));
  gh.factory<_i25.BranchBloc>(
      () => _i25.BranchBloc(useCase: get<_i19.GetBranchUseCase>()));
  gh.factory<_i26.GetQuestionAnswerUseCase>(
      () => _i26.GetQuestionAnswerUseCase(get<_i20.QuestionListRepository>()));
  gh.factory<_i27.QuestionAnswerBloc>(() => _i27.QuestionAnswerBloc(
      get<_i26.GetQuestionAnswerUseCase>(), get<_i24.UpdateAnswerUseCase>()));
  return get;
}
