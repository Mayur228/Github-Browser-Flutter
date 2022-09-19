import 'package:flutter/material.dart';
import 'package:github_browser/features/homescreen/presentation/page/home_page.dart';

import 'core/di/injection.dart';
import 'features/question_list/presentation/page/question_list_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // home: QuestionListPage(),
    );
  }
}
