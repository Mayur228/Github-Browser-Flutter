import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/branchscreen/presentation/bloc/branch_event.dart';
import 'package:github_browser/features/branchscreen/presentation/bloc/branch_state.dart';

import '../../../../core/util/resource.dart';
import '../../domain/entity/branch_entity.dart';
import '../../domain/usecase/get_branch.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final GetBranchUseCase branchUseCase;

  BranchBloc({required GetBranchUseCase useCase})
      : branchUseCase = useCase,
        super(PendingState()) {
    on<GetBranchEvent>(
          (event, emit) async {
        final Resource<List<BranchEntity>> branchResource =
        await branchUseCase(event.htmlUrl);

        final branchResult = branchResource.when(
          data: (data) {
            return data;
          },
          error: (error) {
            return error;
          },
          pending: () {
            return null;
          },
        );

        emit(LoadedState(branchResult));
      },
    );
  }

  getBranch(String htmlUrl) {
    add(GetBranchEvent(htmlUrl));
  }


}
