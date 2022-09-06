import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';

class RepositoryModel extends RepositoryEntity {
  RepositoryModel(
      {required String name,
      required String url,
      required String html_url,})
      : super(name, url, html_url);

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
        name: json['name'],
        url: json['url'],
      html_url: json['html_url'],
    );
  }
}
