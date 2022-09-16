import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';

abstract class SearchRepositoryEvent {

}

class NavigateToSearchedEvent extends SearchRepositoryEvent {
  // final Resource<RepositoryEntity> repository;
  final String ownerName;
  final String repositoryName;
  NavigateToSearchedEvent(this.ownerName, this.repositoryName);
}