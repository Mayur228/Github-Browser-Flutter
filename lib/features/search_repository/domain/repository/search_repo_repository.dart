import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';

abstract class SearchRepoRepository {
  Future<Resource<RepositoryEntity>> getRepository(String ownerName,String repositoryName);
}