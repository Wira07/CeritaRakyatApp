import '../../../models/story_model.dart';

class Story {
  final String id;
  final String title;
  final String region;
  final String category;
  final String description;
  final String fullStory;
  final String audioUrl;
  final String imageUrl;
  final Duration duration;
  final String wisdom;
  final List<String> characters;
  final String setting;
  final DateTime createdAt;

  Story({
    required this.id,
    required this.title,
    required this.region,
    required this.category,
    required this.description,
    required this.fullStory,
    required this.audioUrl,
    required this.imageUrl,
    required this.duration,
    required this.wisdom,
    required this.characters,
    required this.setting,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'region': region,
      'category': category,
      'description': description,
      'fullStory': fullStory,
      'audioUrl': audioUrl,
      'imageUrl': imageUrl,
      'duration': duration.inSeconds,
      'wisdom': wisdom,
      'characters': characters,
      'setting': setting,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      title: json['title'],
      region: json['region'],
      category: json['category'],
      description: json['description'],
      fullStory: json['fullStory'],
      audioUrl: json['audioUrl'],
      imageUrl: json['imageUrl'],
      duration: Duration(seconds: json['duration']),
      wisdom: json['wisdom'],
      characters: List<String>.from(json['characters']),
      setting: json['setting'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  get content => null;
}
