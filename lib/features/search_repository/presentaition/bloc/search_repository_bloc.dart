import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/search_repository/domain/usecase/search_reposirory_usecase.dart';
import 'package:github_browser/features/search_repository/presentaition/bloc/bloc.dart';

class SearchRepositoryBloc
    extends Bloc<SearchRepositoryEvent, SearchRepositoryState> {
  final SearchRepositoryUseCase searchRepositoryUseCase;

  SearchRepositoryBloc(SearchRepositoryUseCase repositoryUseCase)
      : searchRepositoryUseCase = repositoryUseCase,
        super(PendingState()) {
    on<NavigateToSearchedEvent>((event, emit) async {
      emit(SearchingState([event.ownerName,event.repositoryName]));
    });
  }

  searchRepository(String ownerName, String repositoryName) {
    add(NavigateToSearchedEvent(ownerName, repositoryName));
  }
}
