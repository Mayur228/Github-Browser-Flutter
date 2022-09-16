import 'dart:convert';

import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/features/searched_repository/data/model/repository_model.dart';


abstract class RepositorySource {
  Future<RepositoryModel> getRepository(
      String ownerName, String repositoryName);
}

class RepositorySourceImpl implements RepositorySource {
  final ApiSource apiSource;

  RepositorySourceImpl(this.apiSource);

  @override
  Future<RepositoryModel> getRepository(
      String ownerName, String repositoryName) async {
    final response =
        await apiSource.init().get("repos/$ownerName/$repositoryName");

    return Future.value(
      RepositoryModel.fromJson(
        json.decode(
          response.toString(),
        ),
      ),
    );

  }
}
