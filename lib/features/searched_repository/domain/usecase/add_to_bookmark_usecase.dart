import 'package:github_browser/features/homescreen/domain/entity/home_entity.dart';
import 'package:github_browser/features/searched_repository/domain/entities/searched_repo_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AddToBookmarkUseCase {
  AddToBookmarkUseCase();

  addToBookmark(SearchedRepoEntity searchedRepoEntity) async {
    final prefs = await SharedPreferences.getInstance();
    final homeEntityString = prefs.getString('REPO_BOOKMARK') ?? '';


    List<HomeEntity> list = [];
    if(homeEntityString.isNotEmpty == true) {
      list = HomeEntity.decode(homeEntityString);
    }else{
      list = [];
    }

    list.add(
      HomeEntity(
        userName: searchedRepoEntity.owner.userName,
        userAvatar: searchedRepoEntity.owner.avatar,
        repoName: searchedRepoEntity.repoName,
        htmlUrl: searchedRepoEntity.htmlUrl,
      ),
    );

    final homeEntity = HomeEntity.encode(list);

    prefs.setString('REPO_BOOKMARK', homeEntity);
  }
}
