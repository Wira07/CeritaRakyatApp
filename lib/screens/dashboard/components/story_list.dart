import 'package:flutter/material.dart';
import '../../../models/story_model.dart';
import 'animated_story_item.dart';

class StoryList extends StatelessWidget {
  final List<Story> stories;
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const StoryList({
    Key? key,
    required this.stories,
    required this.fadeAnimation,
    required this.slideAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideTransition(
        position: slideAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: AnimatedList(
            padding: EdgeInsets.all(16),
            initialItemCount: stories.length,
            itemBuilder: (context, index, animation) {
              if (index >= stories.length) return SizedBox.shrink();

              return AnimatedStoryItem(
                story: stories[index],
                index: index,
                animation: animation,
              );
            },
          ),
        ),
      ),
    );
  }
}