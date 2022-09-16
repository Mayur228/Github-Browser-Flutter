import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';
import 'package:github_browser/features/searched_repository/domain/repository/search_repo_repository.dart';

import '../../../../core/util/resource.dart';

abstract class SearchedRepositoryEvent {

}

class GetRepositoryEvent extends SearchedRepositoryEvent {
  final String ownerName;
  final String repositoryName;

  GetRepositoryEvent(this.ownerName, this.repositoryName);
}

class RedirectToBranchEvent extends SearchedRepositoryEvent {
  final String htmlUrl;

  RedirectToBranchEvent(this.htmlUrl);
}

class AddToBookmarkEvent extends SearchedRepositoryEvent {
  final SearchedRepoEntity searchedRepoEntity;

  AddToBookmarkEvent(this.searchedRepoEntity);

}