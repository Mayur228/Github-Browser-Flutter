abstract class BranchEvent {

}


class GetBranchEvent extends BranchEvent {
  final String htmlUrl;

  GetBranchEvent(this.htmlUrl);
}