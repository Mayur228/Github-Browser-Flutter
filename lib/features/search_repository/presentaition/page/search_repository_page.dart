import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/search_repository/data/repository/search_repo_repository.dart';
import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/features/search_repository/data/source/search_repository_source.dart';
import 'package:github_browser/features/search_repository/domain/usecase/search_reposirory_usecase.dart';
import 'package:github_browser/features/search_repository/presentaition/bloc/bloc.dart';
import 'package:github_browser/features/search_repository/presentaition/widgets/search_repository_widget.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';
import 'package:github_browser/features/searched_repository/presentation/page/searched_repository_page.dart';

class SearchRepositoryPage extends StatelessWidget {

  final SearchRepositoryBloc _bloc;

  SearchRepositoryPage({Key? key}) :  _bloc = SearchRepositoryBloc(
    SearchRepositoryUseCase(
      SearchRepoRepositoryImpl(SearchRepositorySource(ApiSource())),
    ),
  ), super(key: key);

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
    final bloc = _bloc;
    return BlocProvider(
      create: (_) => bloc,
      child: blocConsumer(bloc),
    );
  }

  Widget _buildAllPending() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(error),
    );
  }

/*
  BlocBuilder<SearchRepositoryBloc, SearchRepositoryState> blocBuilder(
      SearchRepositoryBloc bloc) {
    return BlocBuilder<SearchRepositoryBloc, SearchRepositoryState>(
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
          return _buildError(state.error.toString());
        } else if (state is LoadedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchedRepositoryPage(
                searchedRepoEntity: SearchedRepoEntity(
                  state.repositoryData.name,
                  state.repositoryData.name,
                  state.repositoryData.url,
                  state.repositoryData.owner,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
*/

  BlocConsumer<SearchRepositoryBloc, SearchRepositoryState> blocConsumer(
      SearchRepositoryBloc bloc) {
    return BlocConsumer(
      builder: (context, state) {
        return SearchRepositoryWidget(
          onSearch: (value) {
            List<String> searchParam = value as List<String>;
            if (searchParam.isNotEmpty) {
              bloc.searchRepository(searchParam.first, searchParam.last);
            }
          },
        );
      },
      listener: (context, state) {
        if (state is LoadedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchedRepositoryPage(
                searchedRepoEntity: SearchedRepoEntity(
                  state.repositoryData.name,
                  state.repositoryData.name,
                  state.repositoryData.url,
                  state.repositoryData.owner,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
