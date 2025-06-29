import 'package:flutter/material.dart';
import '../../../models/story_model.dart';
import '../data/sample_stories.dart';

class StoryController extends ChangeNotifier {
  final List<Story> _stories = SampleStories.getStories();
  String _selectedCategory = 'Semua';

  List<Story> get stories => _stories;
  String get selectedCategory => _selectedCategory;

  List<Story> get filteredStories {
    if (_selectedCategory == 'Semua') {
      return _stories;
    }
    return _stories.where((story) => story.category == _selectedCategory).toList();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void addStory(Story story) {
    _stories.add(story);
    notifyListeners();
  }
}