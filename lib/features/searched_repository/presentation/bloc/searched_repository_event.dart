import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';

abstract class SearchedRepositoryEvent {

}

class GetBranchEvent extends SearchedRepositoryEvent {
  final String htmlUrl;

  GetBranchEvent(this.htmlUrl);
}

class AddToBookmarkEvent extends SearchedRepositoryEvent {
  final SearchedRepoEntity searchedRepoEntity;

  AddToBookmarkEvent(this.searchedRepoEntity);

}