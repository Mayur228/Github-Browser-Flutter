import 'package:github_browser/core/util/api_source.dart';

abstract class SearchRepositorySource {
  final ApiSource apiSource;
  SearchRepositorySource(this.apiSource);
}

