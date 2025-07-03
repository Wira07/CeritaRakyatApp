import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/story_model.dart';

class FavoriteService {
  static const String _storageKey = 'favorite_stories';

  // Get all favorite stories
  Future<List<Story>> getFavoriteStories() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? favoritesJson = prefs.getString(_storageKey);

      if (favoritesJson == null) return [];

      final List<dynamic> favoritesList = json.decode(favoritesJson);
      return favoritesList.map((json) => Story.fromJson(json)).toList();
    } catch (e) {
      print('Error getting favorite stories: $e');
      return [];
    }
  }

  // Add story to favorites
  Future<bool> addToFavorites(Story story) async {
    try {
      final List<Story> favorites = await getFavoriteStories();

      // Check if story already exists
      if (favorites.any((s) => s.id == story.id)) {
        return false; // Already in favorites
      }

      favorites.add(story);
      return await _saveFavorites(favorites);
    } catch (e) {
      print('Error adding to favorites: $e');
      return false;
    }
  }

  // Remove story from favorites
  Future<bool> removeFromFavorites(Story story) async {
    try {
      final List<Story> favorites = await getFavoriteStories();
      favorites.removeWhere((s) => s.id == story.id);
      return await _saveFavorites(favorites);
    } catch (e) {
      print('Error removing from favorites: $e');
      return false;
    }
  }

  // Check if story is in favorites
  Future<bool> isFavorite(Story story) async {
    try {
      final List<Story> favorites = await getFavoriteStories();
      return favorites.any((s) => s.id == story.id);
    } catch (e) {
      print('Error checking favorite status: $e');
      return false;
    }
  }

  // Clear all favorites
  Future<bool> clearAllFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_storageKey);
    } catch (e) {
      print('Error clearing favorites: $e');
      return false;
    }
  }

  // Get favorites count
  Future<int> getFavoritesCount() async {
    try {
      final List<Story> favorites = await getFavoriteStories();
      return favorites.length;
    } catch (e) {
      print('Error getting favorites count: $e');
      return 0;
    }
  }

  // Toggle favorite status
  Future<bool> toggleFavorite(Story story) async {
    try {
      final bool isFav = await isFavorite(story);
      if (isFav) {
        return await removeFromFavorites(story);
      } else {
        return await addToFavorites(story);
      }
    } catch (e) {
      print('Error toggling favorite: $e');
      return false;
    }
  }

  // Private method to save favorites
  Future<bool> _saveFavorites(List<Story> favorites) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String favoritesJson = json.encode(
        favorites.map((story) => story.toJson()).toList(),
      );
      return await prefs.setString(_storageKey, favoritesJson);
    } catch (e) {
      print('Error saving favorites: $e');
      return false;
    }
  }
}
