import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/branchscreen/presentation/bloc/branch_bloc.dart';
import 'package:github_browser/features/branchscreen/presentation/bloc/branch_state.dart';
import 'package:github_browser/features/branchscreen/presentation/widget/list_widget.dart';

import '../../../../core/util/api_source.dart';
import '../../data/repository/branch_repository.dart';
import '../../domain/entity/branch_entity.dart';
import '../../domain/usecase/get_branch.dart';

class BranchPage extends StatelessWidget {
  // final List<BranchEntity> list;
  final String htmlUrl;

  const BranchPage({Key? key, required this.htmlUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch'),
      ),
      body: provider(context),
    );
  }

  BlocProvider<BranchBloc> provider(BuildContext context) {
    final bloc = BranchBloc(
      useCase: GetBranchUseCase(
        BranchRepositoryImpl(
          ApiSource(),
        ),
      ),
    );
    bloc.getBranch(htmlUrl);
    return BlocProvider(
      create: (_) => bloc,
      child: blocConsumer(bloc),
    );

  }

  BlocConsumer<BranchBloc, BranchState> blocConsumer(BranchBloc bloc) {
    return BlocConsumer(
      builder: (context, state) {
        if (state is PendingState) {
          return Container();
        } else if (state is LoadedState) {
          return ListWidget(list: state.branchEntity);
        } else {
          return Container();
        }
      },
      listener: (context, state) {

      },
    );
  }
}