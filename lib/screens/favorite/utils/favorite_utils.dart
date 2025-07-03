import 'package:flutter/material.dart';
import '../../../models/story_model.dart';

class FavoriteUtils {
  // Show success message
  static void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green[600],
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Show error message
  static void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white),
            SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red[600],
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }

  // Show info message
  static void showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info, color: Colors.white),
            SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.orange[700],
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }

  // Show confirmation dialog
  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
    Color? confirmColor,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelText),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    confirmText,
                    style: TextStyle(color: confirmColor ?? Colors.red),
                  ),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  // Format favorites count text
  static String formatFavoritesCount(int count) {
    if (count == 0) return 'Belum ada favorit';
    if (count == 1) return '1 cerita favorit';
    return '$count cerita favorit';
  }

  // Get favorite status message
  static String getFavoriteStatusMessage(bool isAdded, String storyTitle) {
    if (isAdded) {
      return '"$storyTitle" ditambahkan ke favorit';
    } else {
      return '"$storyTitle" dihapus dari favorit';
    }
  }

  // Validate story for favorites
  static bool isValidStoryForFavorites(Story story) {
    return story.id.isNotEmpty &&
        story.title.isNotEmpty &&
        story.content.isNotEmpty;
  }

  // Sort stories by different criteria
  static List<Story> sortStories(
    List<Story> stories,
    FavoriteSortType sortType,
  ) {
    List<Story> sortedStories = List.from(stories);

    switch (sortType) {
      case FavoriteSortType.alphabetical:
        sortedStories.sort((a, b) => a.title.compareTo(b.title));
        break;
      case FavoriteSortType.alphabeticalReverse:
        sortedStories.sort((a, b) => b.title.compareTo(a.title));
        break;
      case FavoriteSortType.newest:
        // Assuming there's a dateAdded field in Story model
        // sortedStories.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
        break;
      case FavoriteSortType.oldest:
        // sortedStories.sort((a, b) => a.dateAdded.compareTo(b.dateAdded));
        break;
    }

    return sortedStories;
  }

  // Filter stories by search query
  static List<Story> filterStories(List<Story> stories, String query) {
    if (query.isEmpty) return stories;

    return stories.where((story) {
      return story.title.toLowerCase().contains(query.toLowerCase()) ||
          story.content.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  // Get favorite icon based on status
  static IconData getFavoriteIcon(bool isFavorite) {
    return isFavorite ? Icons.favorite : Icons.favorite_border;
  }

  // Get favorite color based on status
  static Color getFavoriteColor(bool isFavorite) {
    return isFavorite ? Colors.red : Colors.grey;
  }
}

// Enum for sort types
enum FavoriteSortType { alphabetical, alphabeticalReverse, newest, oldest }
