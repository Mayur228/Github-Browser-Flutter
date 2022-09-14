
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';

abstract class SearchRepositoryState {

}

class PendingState extends SearchRepositoryState {}

class ErrorState extends SearchRepositoryState {
  final dynamic error;
  ErrorState(this.error);
}

class LoadedState extends SearchRepositoryState {
  final RepositoryEntity repositoryData;

  LoadedState(this.repositoryData);
}

class SearchingState extends SearchRepositoryState {
  final List<String> searchParam;

  SearchingState(this.searchParam);
}