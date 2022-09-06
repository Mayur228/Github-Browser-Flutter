import 'package:flutter/material.dart';
import 'package:github_browser/features/homescreen/presentation/widgets/floating_button_widget.dart';
import 'package:github_browser/features/search_repository/presentaition/page/search_repository_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Browser'),
      ),
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
    );
  }
}
