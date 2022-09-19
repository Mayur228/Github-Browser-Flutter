import '../../domain/entity/branch_entity.dart';

class BranchModel extends BranchEntity {
  BranchModel({required String name, String? message}) : super(name);

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      name: json['name'],
      message: json['message'],
    );
  }
}
