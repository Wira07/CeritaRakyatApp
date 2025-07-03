import 'package:flutter/material.dart';
import '../../../models/story_model.dart';
import '../../../widgets/story/story_card_widget.dart';

class FavoriteItemWidget extends StatelessWidget {
  final Story story;
  final int index;
  final Function(Story) onRemoveFromFavorites;
  final VoidCallback onTap;

  const FavoriteItemWidget({
    Key? key,
    required this.story,
    required this.index,
    required this.onRemoveFromFavorites,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300 + (index * 100)),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(30 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: Dismissible(
              key: Key(story.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: Colors.white, size: 28),
                    SizedBox(height: 4),
                    Text(
                      'Hapus',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              confirmDismiss: (direction) async {
                return await _showConfirmDialog(context);
              },
              onDismissed: (direction) {
                onRemoveFromFavorites(story);
                _showSnackbar(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                child: StoryCardWidget(story: story, onTap: onTap),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _showConfirmDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus dari Favorit'),
          content: Text(
            'Apakah Anda yakin ingin menghapus "${story.title}" dari daftar favorit?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info, color: Colors.white),
            SizedBox(width: 10),
            Expanded(child: Text('"${story.title}" dihapus dari favorit')),
          ],
        ),
        backgroundColor: Colors.orange[700],
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
