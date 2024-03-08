import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> favoriteItem = [];

  void setFavorite(int value) {
    favoriteItem.add(value);
    notifyListeners();
  }

  void removeFavorite(int value) {
    favoriteItem.remove(value);
    notifyListeners();
  }
}
