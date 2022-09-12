import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/data/model/repository_model.dart';
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';
import 'package:github_browser/features/search_repository/domain/usecase/search_reposirory_usecase.dart';
import 'package:github_browser/features/search_repository/presentaition/bloc/bloc.dart';

class SearchRepositoryBloc
    extends Bloc<SearchRepositoryEvent, SearchRepositoryState> {
  final SearchRepositoryUseCase searchRepositoryUseCase;

  SearchRepositoryBloc(SearchRepositoryUseCase repositoryUseCase)
      : searchRepositoryUseCase = repositoryUseCase,
        super(PendingState()) {
    on<GetRepositoryEvent>((event, emit) async {
      final Resource repositoryResource =
          await searchRepositoryUseCase(event.ownerName, event.repositoryName);

      repositoryResource.when(data: (data) {
        var repoData = data as RepositoryModel;
        return emit(
          LoadedState(
            RepositoryEntity(
              repoData.name,
              repoData.url,
              repoData.html_url,
              repoData.owner,
            ),
          ),
        );
      }, error: (error) {
        return emit(ErrorState(error));
      }, pending: () {
        return null;
      });

      // emit(LoadedState(repositoryResult));
    });
  }

  searchRepository(String ownerName, String repositoryName) {
    add(GetRepositoryEvent(ownerName, repositoryName));
  }
}
