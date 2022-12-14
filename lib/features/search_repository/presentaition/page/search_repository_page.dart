import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/search_repository/presentaition/bloc/bloc.dart';
import 'package:github_browser/features/search_repository/presentaition/widgets/search_repository_widget.dart';
import 'package:github_browser/features/searched_repository/presentation/page/searched_repository_page.dart';

import '../../../../core/di/injection.dart';


class SearchRepositoryPage extends StatelessWidget {

  final SearchRepositoryBloc _bloc;

  SearchRepositoryPage({Key? key}) : _bloc = getIt<SearchRepositoryBloc>(), super(key: key);

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
        if (state is SearchingState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchedRepositoryPage(
                ownerName: state.searchParam.first,
                repoName: state.searchParam.last,
              ),
            ),
          );
        }
      },
    );
  }
}
