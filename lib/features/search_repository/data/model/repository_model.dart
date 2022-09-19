class RepositoryModel {
  final String name;
  final String url;
  final String html_url;

  RepositoryModel({
    required String name,
    required String url,
    required String html_url,
  })
      : name = name,
        url = url,
        html_url = html_url;
}
