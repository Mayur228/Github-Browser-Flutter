import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/data/source/search_repository_source.dart';
import 'package:github_browser/features/searched_repository/domain/repository/search_repo_repository.dart';

import '../../domain/entities/searched_repo_entity.dart';
import '../source/repository_source.dart';

class SearchRepoRepositoryImpl implements SearchRepoRepository {
  RepositorySource repositorySource;

  SearchRepoRepositoryImpl(this.repositorySource);

  @override
  Future<Resource<SearchedRepoEntity>> getRepository(
      String ownerName, String repositoryName) async {
    final repoEntity =
        await repositorySource.getRepository(ownerName, repositoryName);

    return Future.value(
      Resource.data(
        SearchedRepoEntity(
          name: repoEntity.owner.userName,
          repoName: repoEntity.name,
          htmlUrl: repoEntity.html_url,
          owner: repoEntity.owner,
        ),
      ),
    );
  }
}
