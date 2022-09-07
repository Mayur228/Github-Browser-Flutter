import 'dart:convert';
import 'dart:convert' as convert;


import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/repository/branch_repository.dart';
import 'package:http/http.dart' as http;

import '../model/branch_model.dart';

class BranchRepositoryImpl implements BranchRepository {
  @override
  Future<Resource<List<BranchEntity>>> getBranch(String htmlUrl) async{
    final response = await http.get(Uri.parse("$htmlUrl/branches"));

    if(response.statusCode == 200) {
      // print(response.body);
      var data = json.decode(response.body);

      var list = <BranchModel>[];
      for(var data in data) {
        list.add(BranchModel.fromJson(data));
      }
      print(list.first.name);
      // List<BranchModel> list = data.map((element) {
      //   return BranchModel.fromJson(element);
      // }).toList();

      // print(list);
      // print(Resource.data(convert.jsonDecode(response.body)[0]));
      return Future.value(Resource.data(list));
      // return Future.value(Resource.data(convert.jsonDecode(response.body)));
      return Future.value(Resource.data([BranchEntity('abc')]));
    }else {
      // return Future.value(Resource.error(response.statusCode));
      return Future.value(Resource.data([BranchEntity('abc')]));
    }
  }

}