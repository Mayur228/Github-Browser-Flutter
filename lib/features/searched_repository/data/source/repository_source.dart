import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:github_browser/core/error/error.dart';
import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/features/searched_repository/data/model/repository_model.dart';
import 'package:injectable/injectable.dart';

abstract class RepositorySource {
  Future<RepositoryModel?> getRepository(
      String ownerName, String repositoryName);
}

@Singleton(as: RepositorySource)
class RepositorySourceImpl implements RepositorySource {
  final ApiSource apiSource;

  RepositorySourceImpl(this.apiSource);

  @override
  Future<RepositoryModel?> getRepository(
    String ownerName,
    String repositoryName,
  ) async {
    RepositoryModel? repositoryModel;

    try {
      final response = await apiSource.init().get("repos/$ownerName/$repositoryName");
      repositoryModel =  RepositoryModel.fromJson(
        json.decode(
          response.toString(),
        ),
      );
    } on DioError catch (e) {
      if (e.response!.statusMessage != null) {
        throw ServerError(e.response!.statusMessage.toString());
      } else {
        throw ServerError(e.message);
      }
    }
    return repositoryModel;
  }
}
