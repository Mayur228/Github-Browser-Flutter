import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/searched_repository/data/model/repository_model.dart';
import 'package:github_browser/features/branchscreen/domain/entity/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';
import 'package:github_browser/features/searched_repository/domain/usecase/add_to_bookmark_usecase.dart';
import 'package:github_browser/features/branchscreen/domain/usecase/get_branch.dart';
import 'package:github_browser/features/searched_repository/domain/usecase/searching_repository_usecase.dart';
import 'package:github_browser/features/searched_repository/presentation/bloc/searched_repository_event.dart';
import 'package:github_browser/features/searched_repository/presentation/bloc/searched_repository_state.dart';

import '../../../../core/util/resource.dart';

class SearchedRepositoryBloc
    extends Bloc<SearchedRepositoryEvent, SearchedRepositoryState> {
  final GetBranchUseCase branchUseCase;
  final AddToBookmarkUseCase addToBookmarkUseCase;
  final SearchedRepositoryUseCase searchedRepositoryUseCase;

  SearchedRepositoryBloc({
    required GetBranchUseCase useCase,
    required AddToBookmarkUseCase addToBookmark,
    required SearchedRepositoryUseCase searchedRepository,
  })  : branchUseCase = useCase,
        addToBookmarkUseCase = addToBookmark,
        searchedRepositoryUseCase = searchedRepository,
        super(PendingState()) {
    on<GetRepositoryEvent>(
      (event, emit) async {
        final Resource repositoryResource = await searchedRepositoryUseCase(
            event.ownerName, event.repositoryName);

        repositoryResource.when(
          data: (data) {
            var repoData = data as SearchedRepoEntity;
            return emit(
              LoadedState(
                repoData
              ),
            );
          },
          error: (error) {
            return emit(ErrorState());
          },
          pending: () {
            return null;
          },
        );
      },
    );

    on<RedirectToBranchEvent>((event, emit) {
      emit(RedirectToBranchState(event.htmlUrl));
    });

    on<AddToBookmarkEvent>(
      (event, emit) async {
        addToBookmarkUseCase.addToBookmark(event.searchedRepoEntity);

        emit(Bookmarked());
      },
    );
  }

  void getRepository(String ownerName, String repoName) {
    add(GetRepositoryEvent(ownerName, repoName));
  }

  redirectToBranch(String htmlUrl) {
    add(
      RedirectToBranchEvent(htmlUrl),
    );
  }

  void addToBookmark(SearchedRepoEntity searchedRepoEntity) {
    add(
      AddToBookmarkEvent(searchedRepoEntity),
    );
  }
}
