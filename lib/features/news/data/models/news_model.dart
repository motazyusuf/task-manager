class Articles {
  final List<Article> articles;
  Articles({required this.articles});

  factory Articles.fromJson(Map<String, dynamic> json){
    return Articles(
        articles: (json["articles"] as List).map(
                (article) => Article.fromJson(article)
        ).toList()
    );
  }

}

class Article {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String publishedAt;
  final String? urlToImage;
  final String? content;

  Article({
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    this.content,
    required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        content: json["content"],
        publishedAt: json["publishedAt"]);
  }


}
