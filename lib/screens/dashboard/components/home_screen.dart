import 'package:flutter/material.dart';

import '../../../models/story_model.dart';
import '../../../navigasi/CustomBottomNavigation.dart';
import '../../add_new_story_screen.dart';
import '../../quiz_screen.dart';
import '../controllers/home_animation_controller.dart';
import '../controllers/story_controller.dart';
import 'home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late HomeAnimationController _animationController;
  late StoryController _storyController;

  @override
  void initState() {
    super.initState();
    _animationController = HomeAnimationController();
    _storyController = StoryController();

    _animationController.initializeAnimations(this);
    _animationController.startAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => QuizScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            );
          },
          transitionDuration: Duration(milliseconds: 300),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SlideTransition(
          position: _animationController.headerSlideAnimation,
          child: FadeTransition(
            opacity: _animationController.headerFadeAnimation,
            child: AppBar(
              title: Text("Cerita Rakyat Nusantara"),
              backgroundColor: Colors.brown[700],
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _storyController,
          builder: (context, child) {
            return HomeContent(
              filteredStories: _storyController.filteredStories,
              selectedCategory: _storyController.selectedCategory,
              onCategoryChanged: _storyController.setSelectedCategory,
              headerSlideAnimation: _animationController.headerSlideAnimation,
              headerFadeAnimation: _animationController.headerFadeAnimation,
              contentFadeAnimation: _animationController.contentFadeAnimation,
              contentSlideAnimation: _animationController.contentSlideAnimation,
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
        favoriteStories: [],
        onRemoveFromFavorites: (Story story) {},
      ),
      floatingActionButton: ScaleTransition(
        scale: _animationController.fabScaleAnimation,
        child: FloatingActionButton(
          backgroundColor: Colors.brown[700],
          onPressed: () async {
            final newStory = await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AddNewStoryScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                transitionDuration: Duration(milliseconds: 400),
              ),
            );

            if (newStory != null && newStory is Story) {
              _storyController.addStory(newStory);
              _showSuccessSnackBar(newStory.title);
            }
          },
          tooltip: 'Tambah Cerita Baru',
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showSuccessSnackBar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text('Cerita "$title" berhasil ditambahkan!'),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }
}