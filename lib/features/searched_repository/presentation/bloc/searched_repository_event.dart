abstract class SearchedRepositoryEvent {

}

class GetBranchEvent extends SearchedRepositoryEvent {
  final String htmlUrl;

  GetBranchEvent(this.htmlUrl);
}