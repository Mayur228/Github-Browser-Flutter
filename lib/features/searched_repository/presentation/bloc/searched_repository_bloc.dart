import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/usecase/get_branch.dart';
import 'package:github_browser/features/searched_repository/presentation/bloc/searched_repository_event.dart';
import 'package:github_browser/features/searched_repository/presentation/bloc/searched_repository_state.dart';

import '../../../../core/util/resource.dart';

class SearchedRepositoryBloc
    extends Bloc<SearchedRepositoryEvent, SearchedRepositoryState> {
  final GetBranchUseCase branchUseCase;

  SearchedRepositoryBloc({required GetBranchUseCase useCase})
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
