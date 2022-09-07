import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';

abstract class BranchRepository {
  Future<Resource<List<BranchEntity>>> getBranch(String htmlUrl);
}