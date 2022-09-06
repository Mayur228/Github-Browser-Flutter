import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';

class BranchModel extends BranchEntity {
  BranchModel({required String name}): super(name);

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(name: json['name']);
  }
}