import 'package:flutter/material.dart';

import '../../models/story_model.dart';

class StoryContentWidget extends StatelessWidget {
  final Story story;

  const StoryContentWidget({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.brown[100],
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.brown[400],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            story.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Colors.brown[600],
              ),
              SizedBox(width: 4),
              Text(
                story.region,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            story.description,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}