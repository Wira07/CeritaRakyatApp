import 'package:flutter/material.dart';
import '../../../models/story_model.dart';
import '../../../widgets/common/header_widget.dart';
import '../../../widgets/story/category_filter_widget.dart';
import 'story_list.dart';

class HomeContent extends StatelessWidget {
  final List<Story> filteredStories;
  final String selectedCategory;
  final Function(String) onCategoryChanged;
  final Animation<Offset> headerSlideAnimation;
  final Animation<double> headerFadeAnimation;
  final Animation<double> contentFadeAnimation;
  final Animation<Offset> contentSlideAnimation;

  const HomeContent({
    Key? key,
    required this.filteredStories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.headerSlideAnimation,
    required this.headerFadeAnimation,
    required this.contentFadeAnimation,
    required this.contentSlideAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Animated Header Widget
        SlideTransition(
          position: headerSlideAnimation,
          child: FadeTransition(
            opacity: headerFadeAnimation,
            child: HeaderWidget(),
          ),
        ),

        // Animated Category Filter
        SlideTransition(
          position: contentSlideAnimation,
          child: FadeTransition(
            opacity: contentFadeAnimation,
            child: CategoryFilterWidget(
              selectedCategory: selectedCategory,
              onCategoryChanged: onCategoryChanged,
            ),
          ),
        ),

        // Animated Story List
        StoryList(
          stories: filteredStories,
          fadeAnimation: contentFadeAnimation,
          slideAnimation: contentSlideAnimation,
        ),
      ],
    );
  }
}