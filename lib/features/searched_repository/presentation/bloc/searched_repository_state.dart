import 'package:github_browser/features/branchscreen/domain/entity/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';

abstract class SearchedRepositoryState {

}

class PendingState extends SearchedRepositoryState {

}

class ErrorState extends SearchedRepositoryState {
  final String error;

  ErrorState(this.error);
}

class LoadedState extends SearchedRepositoryState {
  // final List<BranchEntity> branchEntity;
  //
  // LoadedState(this.branchEntity);

  final SearchedRepoEntity repositoryData;

  LoadedState(this.repositoryData);
}

class RedirectToBranchState extends SearchedRepositoryState {
  final String htmlUrl;

  RedirectToBranchState(this.htmlUrl);
}

class Bookmarked extends SearchedRepositoryState {
  final SearchedRepoEntity repoData;
  Bookmarked(this.repoData);
}