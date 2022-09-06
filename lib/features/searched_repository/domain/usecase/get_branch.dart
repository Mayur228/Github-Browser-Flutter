import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/repository/branch_repository.dart';

class GetBranchUseCase {
  final BranchRepository repository;

  GetBranchUseCase(this.repository);

 Future<Resource<BranchEntity>> call(String htmlUrl) {
   return repository.getBranch(htmlUrl);
 }

}