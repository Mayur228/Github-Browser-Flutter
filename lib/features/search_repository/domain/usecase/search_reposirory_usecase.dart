import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/domain/repository/search_repo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchRepositoryUseCase {
  final SearchRepoRepository repository;

  SearchRepositoryUseCase(this.repository);

  Future<Resource> call(String ownerName,String repositoryName) {
    return repository.getRepository(ownerName, repositoryName);
  }
}