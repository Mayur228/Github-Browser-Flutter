import 'package:injectable/injectable.dart';

import '../../../../core/util/resource.dart';
import '../repository/search_repo_repository.dart';

@injectable
class SearchedRepositoryUseCase {
  final SearchedRepoRepository repository;

  SearchedRepositoryUseCase(this.repository);

  Future<Resource> call(String ownerName, String repositoryName) {
    return repository.getRepository(ownerName, repositoryName);
  }
}
