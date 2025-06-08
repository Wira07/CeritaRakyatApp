import '../models/story_model.dart';
import '../data/stories_data.dart';

class StoryService {
  static List<Story> _stories = StoriesData.sampleStories;

  static List<Story> getAllStories() {
    return List.from(_stories);
  }

  static List<Story> getStoriesByCategory(String category) {
    if (category == 'Semua') {
      return getAllStories();
    }
    return _stories.where((story) => story.category == category).toList();
  }

  static List<Story> getStoriesByRegion(String region) {
    return _stories.where((story) => story.region == region).toList();
  }

  static Story? getStoryById(String id) {
    try {
      return _stories.firstWhere((story) => story.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Story> searchStories(String query) {
    query = query.toLowerCase();
    return _stories.where((story) {
      return story.title.toLowerCase().contains(query) ||
          story.description.toLowerCase().contains(query) ||
          story.region.toLowerCase().contains(query) ||
          story.category.toLowerCase().contains(query);
    }).toList();
  }

  static List<String> getUniqueCategories() {
    return _stories.map((story) => story.category).toSet().toList();
  }

  static List<String> getUniqueRegions() {
    return _stories.map((story) => story.region).toSet().toList();
  }
}