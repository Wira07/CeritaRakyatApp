import '../../../models/story_model.dart';
import '../utils/favorite_utils.dart';

class FavoriteState {
  final List<Story> favorites;
  final bool isLoading;
  final String? error;
  final FavoriteSortType sortType;
  final String searchQuery;

  const FavoriteState({
    this.favorites = const [],
    this.isLoading = false,
    this.error,
    this.sortType = FavoriteSortType.alphabetical,
    this.searchQuery = '',
  });

  // Create a copy of the state with updated values
  FavoriteState copyWith({
    List<Story>? favorites,
    bool? isLoading,
    String? error,
    FavoriteSortType? sortType,
    String? searchQuery,
  }) {
    return FavoriteState(
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      sortType: sortType ?? this.sortType,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  // Clear error state
  FavoriteState clearError() {
    return copyWith(error: null);
  }

  // Get filtered and sorted favorites
  List<Story> get filteredFavorites {
    List<Story> filtered = FavoriteUtils.filterStories(favorites, searchQuery);
    return FavoriteUtils.sortStories(filtered, sortType);
  }

  // Get favorites count
  int get favoritesCount => favorites.length;

  // Get filtered favorites count
  int get filteredFavoritesCount => filteredFavorites.length;

  // Check if has favorites
  bool get hasFavorites => favorites.isNotEmpty;

  // Check if has filtered favorites
  bool get hasFilteredFavorites => filteredFavorites.isNotEmpty;

  // Check if currently searching
  bool get isSearching => searchQuery.isNotEmpty;

  // Check if story is favorite
  bool isFavorite(Story story) {
    return favorites.any((favorite) => favorite.id == story.id);
  }

  @override
  String toString() {
    return 'FavoriteState(favorites: ${favorites.length}, isLoading: $isLoading, error: $error, sortType: $sortType, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FavoriteState &&
        other.favorites == favorites &&
        other.isLoading == isLoading &&
        other.error == error &&
        other.sortType == sortType &&
        other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    return favorites.hashCode ^
        isLoading.hashCode ^
        error.hashCode ^
        sortType.hashCode ^
        searchQuery.hashCode;
  }
}
