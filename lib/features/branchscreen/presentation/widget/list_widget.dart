import 'package:flutter/material.dart';
import 'package:github_browser/features/branchscreen/domain/entity/branch_entity.dart';

class ListWidget extends StatelessWidget {
  final List<BranchEntity> list;

  const ListWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            title: Text(list[index].name),
            onTap: () {

            },
          ),
        );
      },
    );
  }
}
