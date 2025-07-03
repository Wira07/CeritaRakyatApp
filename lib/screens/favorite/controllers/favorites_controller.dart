import 'package:flutter/material.dart';
import '../../../models/story_model.dart';

class FavoritesController {
  final TickerProvider vsync;

  // Animation Controllers
  late AnimationController _headerAnimationController;
  late AnimationController _contentAnimationController;
  late AnimationController _emptyStateAnimationController;

  // Animations
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _headerFadeAnimation;
  late Animation<double> _contentFadeAnimation;
  late Animation<Offset> _contentSlideAnimation;
  late Animation<double> _emptyStateScaleAnimation;

  // Getters for animations
  Animation<Offset> get headerSlideAnimation => _headerSlideAnimation;
  Animation<double> get headerFadeAnimation => _headerFadeAnimation;
  Animation<double> get contentFadeAnimation => _contentFadeAnimation;
  Animation<Offset> get contentSlideAnimation => _contentSlideAnimation;
  Animation<double> get emptyStateScaleAnimation => _emptyStateScaleAnimation;

  FavoritesController(this.vsync);

  void initializeAnimations() {
    // Initialize animation controllers
    _headerAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: vsync,
    );

    _contentAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _emptyStateAnimationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: vsync,
    );

    // Initialize animations
    _headerSlideAnimation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerAnimationController,
            curve: Curves.easeOutBack,
          ),
        );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: Curves.easeOut,
      ),
    );

    _contentFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _contentAnimationController,
        curve: Curves.easeOut,
      ),
    );

    _contentSlideAnimation =
        Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _contentAnimationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _emptyStateScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _emptyStateAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    // Start header animation immediately
    _headerAnimationController.forward();

    // Start content animation after short delay
    await Future.delayed(Duration(milliseconds: 300));
    _contentAnimationController.forward();

    // Start empty state animation if needed
    await Future.delayed(Duration(milliseconds: 200));
    _emptyStateAnimationController.forward();
  }

  void showClearAllDialog(
    BuildContext context,
    List<Story> favoriteStories,
    Function(Story) onRemoveFromFavorites,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Semua Favorit'),
          content: Text(
            'Apakah Anda yakin ingin menghapus semua cerita dari daftar favorit?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Clear all favorites
                for (var story in List.from(favoriteStories)) {
                  onRemoveFromFavorites(story);
                }

                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.info, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Semua favorit telah dihapus'),
                      ],
                    ),
                    backgroundColor: Colors.orange[700],
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text('Hapus Semua', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void dispose() {
    _headerAnimationController.dispose();
    _contentAnimationController.dispose();
    _emptyStateAnimationController.dispose();
  }
}
