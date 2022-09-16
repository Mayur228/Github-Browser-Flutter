import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/branchscreen/domain/entity/branch_entity.dart';
import 'package:github_browser/features/branchscreen/domain/repository/branch_repository.dart';

class GetBranchUseCase {
  final BranchRepository repository;

  GetBranchUseCase(this.repository);

 Future<Resource<List<BranchEntity>>> call(String htmlUrl) {
   return repository.getBranch(htmlUrl);
 }

}