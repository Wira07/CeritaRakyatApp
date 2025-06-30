import 'package:flutter/material.dart';
import '../../../models/story_model.dart';
import '../../../widgets/story/story_card_widget.dart';
import '../../story_detail/story_detail_screen.dart';

class AnimatedStoryItem extends StatelessWidget {
  final Story story;
  final int index;
  final Animation<double> animation;

  const AnimatedStoryItem({
    Key? key,
    required this.story,
    required this.index,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      )),
      child: FadeTransition(
        opacity: animation,
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 300 + (index * 100)),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: StoryCardWidget(
                  story: story,
                  onTap: () => _navigateToStoryDetail(context),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToStoryDetail(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StoryDetailScreen(story: story),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 400),
      ),
    );
  }
}