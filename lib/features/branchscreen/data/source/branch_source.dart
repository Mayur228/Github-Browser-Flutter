import 'package:injectable/injectable.dart';

import '../../../../core/util/api_source.dart';
import '../model/branch_model.dart';

abstract class BranchSource {
  Future<List<BranchModel>> getBranch(String htmlUrl);
}

@Singleton(as: BranchSource)
class BranchSourceImp implements BranchSource {
  final ApiSource apiSource;

  BranchSourceImp(this.apiSource);

  @override
  Future<List<BranchModel>> getBranch(String htmlUrl) async {
    final response = await apiSource.init().get("$htmlUrl/branches");

    final list = (response.data as List).map((e) => BranchModel.fromJson(e)).toList();
    return Future.value(list);
  }
}
