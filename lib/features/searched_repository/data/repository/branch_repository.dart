import 'dart:convert';
import 'dart:convert' as convert;

import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/repository/branch_repository.dart';
import 'package:http/http.dart' as http;

import '../model/branch_model.dart';

class BranchRepositoryImpl implements BranchRepository {
  ApiSource apiSource;

  BranchRepositoryImpl(this.apiSource);

  @override
  Future<Resource<List<BranchEntity>>> getBranch(String htmlUrl) async {
    final response = await apiSource.init().get("$htmlUrl/branches");

    if (response.statusCode == 200) {
      final list =
          (response.data as List).map((e) => BranchModel.fromJson(e)).toList();
      return Future.value(
        Resource.data(list),
      );
    } else {
      return Future.value(
        Resource.error(response.statusMessage),
      );
    }
  }
}
