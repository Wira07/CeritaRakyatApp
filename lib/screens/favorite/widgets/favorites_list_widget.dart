import 'package:flutter/material.dart';
import '../../../models/story_model.dart';
import '../../../widgets/story/story_card_widget.dart';
import '../../../screens/story_detail/story_detail_screen.dart';
import 'favorite_item_widget.dart';

class FavoritesListWidget extends StatelessWidget {
  final List<Story> favoriteStories;
  final Function(Story) onRemoveFromFavorites;
  final Animation<Offset> contentSlideAnimation;
  final Animation<double> contentFadeAnimation;

  const FavoritesListWidget({
    Key? key,
    required this.favoriteStories,
    required this.onRemoveFromFavorites,
    required this.contentSlideAnimation,
    required this.contentFadeAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: contentSlideAnimation,
      child: FadeTransition(
        opacity: contentFadeAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header info
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red[600], size: 24),
                  SizedBox(width: 8),
                  Text(
                    '${favoriteStories.length} Cerita Favorit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700],
                    ),
                  ),
                ],
              ),
            ),

            // Favorites list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: favoriteStories.length,
                itemBuilder: (context, index) {
                  final story = favoriteStories[index];

                  return FavoriteItemWidget(
                    story: story,
                    index: index,
                    onRemoveFromFavorites: onRemoveFromFavorites,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  StoryDetailScreen(story: story),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                var begin = Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;

                                var tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                          transitionDuration: Duration(milliseconds: 400),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
