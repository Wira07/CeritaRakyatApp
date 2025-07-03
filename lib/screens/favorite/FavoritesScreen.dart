import 'package:flutter/material.dart';
import '../../models/story_model.dart';
import 'widgets/empty_state_widget.dart';
import 'widgets/favorites_list_widget.dart';
import 'controllers/favorites_controller.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Story> favoriteStories;
  final Function(Story) onRemoveFromFavorites;

  const FavoritesScreen({
    Key? key,
    required this.favoriteStories,
    required this.onRemoveFromFavorites,
  }) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with TickerProviderStateMixin {
  late FavoritesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FavoritesController(this);
    _controller.initializeAnimations();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SlideTransition(
          position: _controller.headerSlideAnimation,
          child: FadeTransition(
            opacity: _controller.headerFadeAnimation,
            child: AppBar(
              title: Text("Cerita Favorit"),
              backgroundColor: Colors.brown[700],
              foregroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              actions: widget.favoriteStories.isNotEmpty
                  ? [
                      PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert),
                        onSelected: (value) {
                          if (value == 'clear_all') {
                            _controller.showClearAllDialog(
                              context,
                              widget.favoriteStories,
                              widget.onRemoveFromFavorites,
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem<String>(
                            value: 'clear_all',
                            child: Row(
                              children: [
                                Icon(Icons.clear_all, color: Colors.red),
                                SizedBox(width: 8),
                                Text('Hapus Semua'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]
                  : null,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: widget.favoriteStories.isEmpty
            ? EmptyStateWidget(
                animation: _controller.emptyStateScaleAnimation,
                onBackToHome: () => Navigator.pop(context),
              )
            : FavoritesListWidget(
                favoriteStories: widget.favoriteStories,
                onRemoveFromFavorites: widget.onRemoveFromFavorites,
                contentSlideAnimation: _controller.contentSlideAnimation,
                contentFadeAnimation: _controller.contentFadeAnimation,
              ),
      ),
    );
  }
}
