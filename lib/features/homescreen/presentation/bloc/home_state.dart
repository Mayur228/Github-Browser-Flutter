import 'package:github_browser/features/homescreen/domain/entity/home_entity.dart';

abstract class HomeState {

}

class NoDataState extends HomeState {
  NoDataState();
}

class DataState extends HomeState {
  final List<HomeEntity> list;
  DataState(this.list);
}