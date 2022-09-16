import 'package:github_browser/features/search_repository/data/model/repository_model.dart';

import '../../data/model/repository_model.dart';

class SearchedRepoEntity {
  final String name;
  final String repoName;
  final String htmlUrl;
  final Owner owner;

  SearchedRepoEntity({
    required this.name,
    required this.repoName,
    required this.htmlUrl,
    required this.owner,
  });
}
