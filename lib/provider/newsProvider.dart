import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  List<String> _selectedCategories = [ ];
  List _allArticles = [];
  List _filteredArticles = [];

  List<String> get selectedCategory => _selectedCategories;
  List get filteredArticles => _filteredArticles;

  void selectCategory(String category) {
   if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      _selectedCategories.add(category);
    }
    _filterArticles();
    notifyListeners();
  }

  void setArticles(List articles) {
    _allArticles = articles;
    _filterArticles();
    notifyListeners();
  }
  void _filterArticles() {
    if (_selectedCategories.isEmpty) {
      _filteredArticles = _allArticles;
    } else {
      _filteredArticles = _allArticles
          .where((article) => _selectedCategories.contains(article['category']))
          .toList();
    }
  }
}
