import 'package:flutter/foundation.dart';

import 'for_listview/images_and_info.dart';

class MovieProvider extends ChangeNotifier {
  final Set<String> _favoriteIds = {};
  final Set<String> _watchedIds = {};

  List<Film> get movies => filmsData;

  List<Film> get favoriteMovies =>
      filmsData.where((film) => _favoriteIds.contains(film.id)).toList();

  List<Film> get favoriteAndWatchedMovies =>
      favoriteMovies.where((film) => _watchedIds.contains(film.id)).toList();

  List<Film> get favoriteAndUnwatchedMovies =>
      favoriteMovies.where((film) => !_watchedIds.contains(film.id)).toList();

  bool isFavorite(String id) => _favoriteIds.contains(id);

  bool isWatched(String id) => _watchedIds.contains(id);

  void toggleFavorite(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }

  void markAsWatched(String id) {
    if (_watchedIds.add(id)) {
      notifyListeners();
    }
  }
}
