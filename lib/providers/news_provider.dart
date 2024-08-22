import 'package:flutter/material.dart';

import '../models/news_article.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  List<NewsArticle> articles = [];


}
















































// import 'package:flutter/material.dart';
// import '../services/api_service.dart';
// import '../models/news_article.dart';

// class NewsProvider with ChangeNotifier {
//   ApiService _apiService = ApiService();
//   List<NewsArticle> _articles = [];
//   bool _isLoading = false;

//   List<NewsArticle> get articles => _articles;
//   bool get isLoading => _isLoading;

//   void fetchArticles() async {
//     _isLoading = true;
//     notifyListeners();
//     _articles = await _apiService.fetchArticles();
//     _isLoading = false;
//     notifyListeners();
//   }
// }
