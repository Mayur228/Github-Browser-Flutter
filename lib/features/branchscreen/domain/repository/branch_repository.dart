import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/branchscreen/domain/entity/branch_entity.dart';

abstract class BranchRepository {
  Future<Resource<List<BranchEntity>>> getBranch(String htmlUrl);
}