import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/features/searched_repository/data/model/repository_model.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';

import '../../../../core/util/resource.dart';

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

    /*try {
      return Future.value(
        RepositoryModel.fromJson(
          json.decode(
            response.toString(),
          ),
        ),
      );
    } on DioError catch (e) {
      if (e.response != null) {
        return Future.value(
            e.response?.statusMessage
        );
      } else {
        return Future.value(
          Resource.error(e.message),
        );
      }
    }
  }*/
}
