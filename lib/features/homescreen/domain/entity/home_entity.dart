import 'dart:convert';

class HomeEntity {
  final String userName;
  final String userAvatar;
  final String repoName;
  final String htmlUrl;

  HomeEntity({required this.userName, required this.userAvatar, required this.repoName, required this.htmlUrl});

  factory HomeEntity.fromJson(Map<String, dynamic> json) {
    return HomeEntity(
      userName: json['userName'],
      userAvatar: json['userAvatar'],
      repoName: json['repoName'],
      htmlUrl: json['htmlUrl'],
    );
  }

  static Map<String, dynamic> toMap(HomeEntity homeEntity) => {
        'userName': homeEntity.userName,
        'userAvatar': homeEntity.userAvatar,
        'repoName': homeEntity.repoName,
        'htmlUrl': homeEntity.htmlUrl
      };

  static String encode(List<HomeEntity> homeEntity) => json.encode(
    homeEntity
        .map<Map<String, dynamic>>((homeEntity) => HomeEntity.toMap(homeEntity))
        .toList(),
  );

  static List<HomeEntity> decode(String homeEntity) =>
      (json.decode(homeEntity) as List<dynamic>)
          .map<HomeEntity>((item) => HomeEntity.fromJson(item))
          .toList();
}
