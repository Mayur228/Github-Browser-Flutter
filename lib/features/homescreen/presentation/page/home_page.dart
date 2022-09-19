import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/core/di/injection.dart';
import 'package:github_browser/features/homescreen/domain/entity/home_entity.dart';
import 'package:github_browser/features/homescreen/domain/usecase/get_bookmarked_usecase.dart';
import 'package:github_browser/features/homescreen/presentation/bloc/home_bloc.dart';
import 'package:github_browser/features/homescreen/presentation/bloc/home_state.dart';
import 'package:github_browser/features/homescreen/presentation/widgets/floating_button_widget.dart';
import 'package:github_browser/features/homescreen/presentation/widgets/home_widget.dart';
import 'package:github_browser/features/search_repository/presentaition/page/search_repository_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Github Browser')),
      floatingActionButton: FloatingButtonWidget(
        onClicked: (val) {
          if (val != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchRepositoryPage(),
              ),
            );
          }
        },
      ),
      body: provider(context),
    );
  }

  BlocProvider<HomeBloc> provider(BuildContext context) {
    final bloc = getIt<HomeBloc>();
    bloc.getBookMarked();
    return BlocProvider(
      create: (_) => bloc,
      child: blocConsumer(bloc),
    );
  }

  BlocConsumer<HomeBloc, HomeState> blocConsumer(HomeBloc bloc) {
    return BlocConsumer(
      builder: (context, state) {
        if (state is NoDataState) {
          return Container();
        } else if (state is DataState) {
          return HomeWidget(list: state.list);
        } else {
          return Container();
        }
      },
      listener: (context, state) {},
    );
  }
}
