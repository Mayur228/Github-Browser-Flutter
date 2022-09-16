import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/homescreen/domain/usecase/get_bookmarked_usecase.dart';
import 'package:github_browser/features/homescreen/presentation/bloc/home_state.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBookmarkedUseCase bookmarkedUseCase;
  HomeBloc({required GetBookmarkedUseCase bookmarked})
      : bookmarkedUseCase = bookmarked,
        super(NoDataState()) {
    on<GetBookmarkedDataEvent>(
          (event, emit) async {
        final data = await bookmarkedUseCase.getSavedData();
        emit(DataState(data));
      },
    );
  }

  getBookMarked() {
    add(GetBookmarkedDataEvent());
  }

}
