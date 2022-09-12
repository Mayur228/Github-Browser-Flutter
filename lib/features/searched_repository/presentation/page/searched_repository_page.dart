import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/features/branchscreen/presentation/page/branch_page.dart';
import 'package:github_browser/features/searched_repository/data/repository/branch_repository.dart';
import 'package:github_browser/features/searched_repository/domain/entities/branch_entity.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';
import 'package:github_browser/features/searched_repository/domain/usecase/get_branch.dart';
import 'package:github_browser/features/searched_repository/presentation/bloc/bloc.dart';
import 'package:github_browser/features/branchscreen/presentation/widget/list_widget.dart';

import '../../data/model/branch_model.dart';

class SearchedRepositoryPage extends StatelessWidget {
  final SearchedRepoEntity searchedRepoEntity;

  const SearchedRepositoryPage({Key? key, required this.searchedRepoEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchedRepoEntity.repoName),
      ),
      body: provider(context),
    );
  }

  BlocProvider<SearchedRepositoryBloc> provider(BuildContext context) {
    final bloc = SearchedRepositoryBloc(
      useCase: GetBranchUseCase(
        BranchRepositoryImpl(
          ApiSource(),
        ),
      ),
    );

    return BlocProvider(
      create: (_) => bloc,
      child: blocConsumer(bloc),
    );
  }

 /* BlocBuilder<SearchedRepositoryBloc, SearchedRepositoryState> blocProvider(
      SearchedRepositoryBloc bloc) {
    return BlocBuilder<SearchedRepositoryBloc, SearchedRepositoryState>(
      builder: (context, state) {
        if (state is PendingState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              title: Text(searchedRepoEntity.name),
              onTap: () {
                bloc.getBranch(searchedRepoEntity.htmlUrl);
              },
            ),
          );
        } else if (state is ErrorState) {
          return Container();
        } else if (state is LoadedState) {
          return ListWidget(list: state.branchEntity);
        }
        return Container();
      },
    );
  }*/

  BlocConsumer<SearchedRepositoryBloc, SearchedRepositoryState> blocConsumer(
      SearchedRepositoryBloc bloc) {
    return BlocConsumer(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            title: Text(searchedRepoEntity.name),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(searchedRepoEntity.owner.avatar),
            ),
            onTap: () {
              bloc.getBranch(searchedRepoEntity.htmlUrl);
            },
          ),
        );
      },
      listener: (context, state) {
        if (state is LoadedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BranchPage(
                list: state.branchEntity,
              ),
            ),
          );
        }
      },
    );
  }
}
