import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_browser/core/util/api_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/util/resource.dart';
import '../../../searched_repository/data/model/repository_model.dart';

abstract class SearchRepositorySource {
  Future<RepositoryModel> getRepository(String ownerName, String repositoryName);
}

@Singleton(as: SearchRepositorySource)
class SearchRepositorySourceImpl implements SearchRepositorySource {
  final ApiSource apiSource;
  SearchRepositorySourceImpl(this.apiSource);

  @override
  Future<RepositoryModel> getRepository(
      String ownerName, String repositoryName)  {
    throw UnimplementedError();

  }
}

