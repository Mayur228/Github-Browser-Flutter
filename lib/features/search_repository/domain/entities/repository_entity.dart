
class RepositoryEntity {
  final String name;
  final String url;
  final String html_url;

  RepositoryEntity(this.name, this.url, this.html_url);

}

class Owner {
  final String userName;
  final String avatar;

  Owner(this.userName, this.avatar);
}
