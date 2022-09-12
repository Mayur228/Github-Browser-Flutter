import '../../data/model/repository_model.dart';

class RepositoryEntity {
  final String name;
  final String url;
  final String html_url;
  final Owner owner;

  RepositoryEntity(this.name, this.url, this.html_url, this.owner);
}

/*class Owner {
  final String userName;
  final String avatar;

  Owner(this.userName, this.avatar);

  // Owner({
  //   required String userName,
  //   required String avatar,
  // })  : userName = userName,
  //       avatar = avatar;
}*/
