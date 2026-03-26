import 'package:flutter/material.dart';


class FavoritesProvider extends ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void toggleFavorite(Map<String, String> memory) {
    if (_favorites.any((m) => m['image'] == memory['image'])) {
      _favorites.removeWhere((m) => m['image'] == memory['image']);
    } else {
      _favorites.add(memory);
    }
    notifyListeners(); 
  }

  bool isFavorite(String imagePath) {
    return _favorites.any((m) => m['image'] == imagePath);
  }
}

final favoritesProvider = FavoritesProvider();