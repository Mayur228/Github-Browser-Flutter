import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/search_repository/data/repository/search_repo_repository.dart';
import 'package:github_browser/features/search_repository/domain/usecase/search_reposirory_usecase.dart';
import 'package:github_browser/features/search_repository/presentaition/bloc/bloc.dart';
import 'package:github_browser/features/search_repository/presentaition/widgets/search_repository_widget.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';
import 'package:github_browser/features/searched_repository/presentation/page/searched_repository_page.dart';

class SearchRepositoryPage extends StatelessWidget {
  const SearchRepositoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Search Repository'),
        ),
      ),
      body: provider(context),
    );
  }

  BlocProvider<SearchRepositoryBloc> provider(BuildContext context) {
    final bloc = SearchRepositoryBloc(
      SearchRepositoryUseCase(
        SearchRepoRepositoryImpl(),
      ),
    );

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<SearchRepositoryBloc, SearchRepositoryState>(
        builder: (context, state) {
          if (state is PendingState) {
            return SearchRepositoryWidget(
              onSearch: (value) {
                List<String> searchParam = value as List<String>;
                if (searchParam.isNotEmpty) {
                  bloc.searchRepository(searchParam.first, searchParam.last);
                }
              },
            );
          } else if (state is ErrorState) {
            return _buildError();
          } else if (state is LoadedState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchedRepositoryPage(
                  searchedRepoEntity:
                      SearchedRepoEntity(state.repositoryData.name, state.repositoryData.name, state.repositoryData.url),
                ),
              ),
            );
           // return SearchedRepositoryPage(
           //         searchedRepoEntity:
           //             SearchedRepoEntity(state.repositoryData.name, state.repositoryData.name, ""),
           //       );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildAllPending() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text("Error in loading data"),
    );
  }
}
