import 'package:flutter/material.dart';
import 'package:github_browser/features/branchscreen/presentation/widget/list_widget.dart';

import '../../../searched_repository/domain/entities/branch_entity.dart';

class BranchPage extends StatelessWidget {
  final List<BranchEntity> list;

  const BranchPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch'),
      ),
      body: ListWidget(list: list),
    );
  }
}
