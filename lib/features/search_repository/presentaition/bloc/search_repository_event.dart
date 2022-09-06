import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';

abstract class SearchRepositoryEvent {

}

class GetRepositoryEvent extends SearchRepositoryEvent {
  // final Resource<RepositoryEntity> repository;
  final String ownerName;
  final String repositoryName;
  GetRepositoryEvent(this.ownerName, this.repositoryName);
}