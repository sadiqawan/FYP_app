import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> _favoriteItem = [];

  List<int> get favoriteItem => _favoriteItem;

  void setFavorite(int value) {
    if (!_favoriteItem.contains(value)) {
      _favoriteItem.add(value);
      notifyListeners();
    }
  }

  void removeFavorite(int value) {
    _favoriteItem.remove(value);
    notifyListeners();
  }
}
