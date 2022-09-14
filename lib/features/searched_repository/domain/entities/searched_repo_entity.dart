import 'package:github_browser/features/search_repository/data/model/repository_model.dart';

class SearchedRepoEntity {
  final name;
  final repoName;
  final htmlUrl;
  final Owner owner;

  SearchedRepoEntity({
    required this.name,
    required this.repoName,
    required this.htmlUrl,
    required this.owner,
  });
}
