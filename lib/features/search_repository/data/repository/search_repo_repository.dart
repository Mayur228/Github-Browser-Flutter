import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/data/source/search_repository_source.dart';
import 'package:github_browser/features/search_repository/domain/repository/search_repo_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepoRepository)
class SearchRepoRepositoryImpl implements SearchRepoRepository {
  @override
  Future<Resource> getRepository(String ownerName, String repositoryName) {
    // TODO: implement getRepository
    throw UnimplementedError();
  }
  /*SearchRepositorySource searchRepositorySource;

  SearchRepoRepositoryImpl(this.searchRepositorySource);

  @override
  Future<Resource<>> getRepository(
      String ownerName, String repositoryName) async {

    return searchRepositorySource.getRepository(ownerName, repositoryName);
  }*/
}
