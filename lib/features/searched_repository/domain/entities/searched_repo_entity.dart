import 'package:github_browser/features/search_repository/data/model/repository_model.dart';

class SearchedRepoEntity {
  final name;
  final repoName;
  final htmlUrl;
  final Owner owner;

  SearchedRepoEntity(
    this.name,
    this.repoName,
    this.htmlUrl,
    this.owner,
  );
}
