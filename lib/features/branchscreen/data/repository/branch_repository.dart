import 'package:github_browser/core/util/resource.dart';
import 'package:github_browser/features/branchscreen/data/source/branch_source.dart';
import 'package:github_browser/features/branchscreen/domain/entity/branch_entity.dart';
import 'package:github_browser/features/branchscreen/domain/repository/branch_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BranchRepository)
class BranchRepositoryImpl implements BranchRepository {
  BranchSource branchSource;

  BranchRepositoryImpl(this.branchSource);

  @override
  Future<Resource<List<BranchEntity>>> getBranch(String htmlUrl) async {
    final response = await branchSource.getBranch(htmlUrl);

    List<BranchEntity> list = response.map(
      (e) => BranchEntity(e.name),
    ).toList();
    return Future.value(Resource(data: list));
  }
}
