import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';

abstract class SearchRepoRepository {
  Future<Resource<SearchedRepoEntity>> getRepository(String ownerName,String repositoryName);
}