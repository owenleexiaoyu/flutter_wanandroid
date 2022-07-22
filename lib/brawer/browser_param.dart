class BrowserParam {
  final String title;
  final String url;
  final int? articleId;

  const BrowserParam({
    required this.title,
    required this.url,
    this.articleId
  });

}