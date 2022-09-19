import 'package:github_browser/core/error/error.dart';
import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/searched_repository/domain/repository/search_repo_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/searched_repo_entity.dart';
import '../source/repository_source.dart';

@Injectable(as: SearchedRepoRepository)
class SearchedRepoRepositoryImpl implements SearchedRepoRepository {
  RepositorySource repositorySource;

  SearchedRepoRepositoryImpl(this.repositorySource);

  @override
  Future<Resource<SearchedRepoEntity>> getRepository(
      String ownerName, String repositoryName) async {

    try {
      final repoEntity =
      await repositorySource.getRepository(ownerName, repositoryName);
      return Future.value(
        Resource.data(
          SearchedRepoEntity(
            name: repoEntity!.owner.userName,
            repoName: repoEntity.name,
            htmlUrl: repoEntity.url,
            owner: repoEntity.owner,
          ),
        ),
      );
    }on ServerError catch(e) {
      return Future.value(Resource.error(e.error));
    }
  }
}
