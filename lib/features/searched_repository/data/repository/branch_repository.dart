import 'dart:convert';

import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/repository/branch_repository.dart';
import 'package:http/http.dart' as http;

import '../model/branch_model.dart';

class BranchRepositoryImpl implements BranchRepository {
  @override
  Future<Resource<BranchEntity>> getBranch(String htmlUrl) async{
    final response = await http.get(Uri.parse("$htmlUrl/branches"));

    if(response.statusCode == 200) {
      // print(response.body);
      return Future.value(Resource.data(BranchModel.fromJson(jsonDecode(response.body))));
      return Future.value(Resource.data(BranchEntity('abc')));
    }else {
      // return Future.value(Resource.error(response.statusCode));
      return Future.value(Resource.data(BranchEntity('abc')));

    }
  }

}