import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_browser/core/util/api_source.dart';

import '../../../../core/util/resource.dart';
import '../model/repository_model.dart';

 class SearchRepositorySource {
  final ApiSource apiSource;
  SearchRepositorySource(this.apiSource);

  Future<Resource> getRepository(
      String ownerName, String repositoryName) async {
    try {
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
    }
  }
}

