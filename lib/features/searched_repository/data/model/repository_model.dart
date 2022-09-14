import 'package:github_browser/features/search_repository/domain/entities/repository_entity.dart';

class RepositoryModel {
  final String name;
  final String url;
  final String html_url;
  final Owner owner;

  RepositoryModel(
      {required String name,
      required String url,
      required String html_url,
      required Owner owner})
      : name = name,
        url = url,
        html_url = html_url,
        owner = owner;

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'],
      url: json['url'],
      html_url: json['html_url'],
      owner: Owner.fromJson(json["owner"]),
    );
  }
}

class Owner {
  final String userName;
  final String avatar;

  Owner({
    required String userName,
    required String avatar,
  })  : userName = userName,
        avatar = avatar;

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      userName: json['login'],
      avatar: json['avatar_url'],
    );
  }
}
