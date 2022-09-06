import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';
import 'package:github_browser/features/search_repository/domain/repository/search_repo_repository.dart';

class SearchRepositoryUseCase {
  final SearchRepoRepository repository;

  SearchRepositoryUseCase(this.repository);

  Future<Resource<RepositoryEntity>> call(String ownerName,String repositoryName) {
    return repository.getRepository(ownerName, repositoryName);
  }
}