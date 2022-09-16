import 'package:flutter/material.dart';
import 'package:github_browser/features/homescreen/presentation/widgets/list_widget.dart';

import '../../domain/entity/home_entity.dart';

class HomeWidget extends StatelessWidget {
  final List<HomeEntity> list;
  const HomeWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWidget(list: list);
  }
}
