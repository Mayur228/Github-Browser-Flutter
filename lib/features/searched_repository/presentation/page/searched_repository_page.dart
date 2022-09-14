import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/core/util/api_source.dart';
import 'package:github_browser/features/branchscreen/presentation/page/branch_page.dart';
import 'package:github_browser/features/searched_repository/data/repository/branch_repository.dart';
import 'package:github_browser/features/searched_repository/domain/usecase/add_to_bookmark_usecase.dart';
import 'package:github_browser/features/searched_repository/domain/usecase/get_branch.dart';
import 'package:github_browser/features/searched_repository/presentation/bloc/bloc.dart';

class SearchedRepositoryPage extends StatelessWidget {
  // final SearchedRepoEntity searchedRepoEntity;
  final String ownerName;
  final String repoName;

  const SearchedRepositoryPage({Key? key, required this.ownerName, required this.repoName, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repoName),
      ),
      body: provider(context),
    );
  }

  BlocProvider<SearchedRepositoryBloc> provider(BuildContext context) {
    final bloc = SearchedRepositoryBloc(
      useCase: GetBranchUseCase(BranchRepositoryImpl(ApiSource())),
      addToBookmark: AddToBookmarkUseCase(),
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
        if(state is PendingState) {
          return userInterFace(bloc,Icons.bookmark_border);
        }else if (state is Bookmarked) {
          return userInterFace(bloc, Icons.bookmark);
        }else {
          return Container();
        }

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

  userInterFace(SearchedRepositoryBloc bloc, IconData bookmarkIcon,) {
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
        trailing: IconButton(
          icon: Icon(bookmarkIcon),
          onPressed: () {
            bloc.addToBookmark(searchedRepoEntity);
          },
        ),
        onTap: () {
          bloc.getBranch(searchedRepoEntity.htmlUrl);
        },
      ),
    );
  }
}
