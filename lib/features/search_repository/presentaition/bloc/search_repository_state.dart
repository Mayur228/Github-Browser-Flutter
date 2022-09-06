
import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';

abstract class SearchRepositoryState {

}

class PendingState extends SearchRepositoryState {}

class ErrorState extends SearchRepositoryState {
  ErrorState(error);
}

class LoadedState extends SearchRepositoryState {
  final RepositoryEntity repositoryData;

  LoadedState(this.repositoryData);
}