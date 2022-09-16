import '../../data/model/repository_model.dart';

/*class RepositoryEntity {
  final String name;
  final String url;
  final String html_url;
  final Owner owner;

  RepositoryEntity(this.name, this.url, this.html_url, this.owner);
}*/
class RepositoryEntity {
  final String ownerName;
  final String repoName;

  RepositoryEntity(this.ownerName, this.repoName);
}

