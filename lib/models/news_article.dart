class NewsArticle {
  final int id;
  final String title;
  final String content;
  final String link;
  final String imageUrl;

  NewsArticle({
    required this.id,
    required this.title,
    required this.content,
    required this.link,
    required this.imageUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      link: json['link'],
      imageUrl: json['featured_image_url'],
    );
  }
}
