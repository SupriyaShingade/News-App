

class ApiService {
  final String apiUrl = "https://newspro.uixxy.com/wp-json/wp/v2/posts";

  // Future<List<NewsArticle>> fetchArticles() async {
  //   final response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((article) => NewsArticle.fromJson(article)).toList();
  //   } else {
  //     throw Exception('Failed to load articles');
  //   }
  // }
  // http://localhost:3000/articles
}
