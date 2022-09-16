import '../../domain/entity/branch_entity.dart';

abstract class BranchState{

}

class PendingState extends BranchState {

}

class ErrorState extends BranchState {

}

class LoadedState extends BranchState {
  final List<BranchEntity> branchEntity;

  LoadedState(this.branchEntity);
}