import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';

abstract class SearchedRepositoryState {

}

class PendingState extends SearchedRepositoryState {

}

class ErrorState extends SearchedRepositoryState {

}

class LoadedState extends SearchedRepositoryState {
  final List<BranchEntity> branchEntity;

  LoadedState(this.branchEntity);
}