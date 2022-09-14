import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/data/model/repository_model.dart';
import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/features/search_repository/data/source/search_repository_source.dart';
import 'package:github_browser/features/search_repository/domain/repository/search_repo_repository.dart';

class SearchRepoRepositoryImpl implements SearchRepoRepository {
  SearchRepositorySource searchRepositorySource;

  SearchRepoRepositoryImpl(this.searchRepositorySource);

  @override
  Future<Resource> getRepository(
      String ownerName, String repositoryName) async {
    /*try {
      final response = await apiSource.init().get("repos/$ownerName/$repositoryName");

      return Future.value(
        Resource.data(
          RepositoryModel.fromJson(
            json.decode(
              response.toString(),
            ),
          ),
        ),
      );

    } on DioError catch (e) {
      if (e.response != null) {
        return Future.value(
          Resource.error(e.response?.statusMessage),
        );
      } else {
        return Future.value(
          Resource.error(e.message),
        );
      }
    }*/

    return searchRepositorySource.getRepository(ownerName, repositoryName);
  }
}
