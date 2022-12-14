import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/core/di/injection.dart';
import 'package:github_browser/features/branchscreen/presentation/page/branch_page.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';
import 'package:github_browser/features/searched_repository/presentation/bloc/bloc.dart';

class SearchedRepositoryPage extends StatelessWidget {
  final String ownerName;
  final String repoName;

  const SearchedRepositoryPage({
    Key? key,
    required this.ownerName,
    required this.repoName,
  }) : super(key: key);

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
    final bloc = getIt<SearchedRepositoryBloc>();

    return BlocProvider(
      create: (_) => bloc,
      child: blocConsumer(bloc),
    );
  }

  BlocConsumer<SearchedRepositoryBloc, SearchedRepositoryState> blocConsumer(
      SearchedRepositoryBloc bloc) {
    bloc.getRepository(ownerName, repoName);
    return BlocConsumer(
      builder: (context, state) {
        if (state is PendingState) {
          return _buildAllPending();
        } else if (state is LoadedState) {
          return userInterFace(
              bloc, state.repositoryData, Icons.bookmark_border);
        } else if (state is ErrorState) {
          return _buildError(state.error);
        } else if (state is Bookmarked) {
          return userInterFace(bloc, state.repoData, Icons.bookmark);
        } else {
          return Container();
        }
      },
      listener: (context, state) {
        if (state is RedirectToBranchState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BranchPage(
                htmlUrl: state.htmlUrl,
              ),
            ),
          );
        }
      },
    );
  }

  userInterFace(
    SearchedRepositoryBloc bloc,
    SearchedRepoEntity entity,
    IconData bookmarkIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        title: Text(entity.repoName),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(entity.owner.avatar),
        ),
        trailing: IconButton(
          icon: Icon(bookmarkIcon),
          onPressed: () {
            bloc.addToBookmark(entity);
          },
        ),
        onTap: () {
          bloc.redirectToBranch(entity.htmlUrl);
        },
      ),
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
}
