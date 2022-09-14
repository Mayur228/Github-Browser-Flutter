import 'package:shared_preferences/shared_preferences.dart';

import '../entity/home_entity.dart';

class GetBookmarkedUseCase {
  getSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    // print(prefs.getString('REPO_BOOKMARK'));
    List<HomeEntity> data = HomeEntity.decode(prefs.getString('REPO_BOOKMARK') ?? '');
    return data;
  }
}