import 'package:flutter/material.dart';
import 'package:github_browser/features/homescreen/domain/entity/home_entity.dart';

class ListWidget extends StatelessWidget {
  final List<HomeEntity> list;

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
            title: Text(list[index].userName),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(list[index].userAvatar),
            ),
            subtitle: Text(list[index].repoName),
            onTap: () {},
          ),
        );
      },
    );
  }
}
