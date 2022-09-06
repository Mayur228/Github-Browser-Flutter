import 'dart:convert';

import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/search_repository/data/model/repository_model.dart';
import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';
import 'package:github_browser/features/search_repository/domain/repository/search_repo_repository.dart';
import 'package:http/http.dart' as http;

class SearchRepoRepositoryImpl implements SearchRepoRepository {
  @override
  Future<Resource<RepositoryEntity>> getRepository(String ownerName, String repositoryName) async{
    final response = await http.get(Uri.parse("https://api.github.com/repos/$ownerName/$repositoryName"));

    if(response.statusCode == 200) {
      return Future.value(Resource.data(RepositoryModel.fromJson(jsonDecode(response.body))));
    }else {
      return Future.value(Resource.error(response.statusCode));
    }
    
  }

}