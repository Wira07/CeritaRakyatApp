import 'package:flutter/material.dart';
import '../../models/story_model.dart';

class StoryCardWidget extends StatefulWidget {
  final Story story;
  final VoidCallback onTap;

  const StoryCardWidget({super.key, required this.story, required this.onTap});

  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shadowAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _shadowAnimation = Tween<double>(begin: 8.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  String _formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString();
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'legenda':
        return Color(0xFFD4AA7D); // Soft golden brown
      case 'dongeng':
        return Color(0xFF8FA68E); // Muted sage green
      case 'mitos':
        return Color(0xFF9B8AA6); // Soft lavender
      case 'sejarah':
        return Color(0xFF7D9BB8); // Dusty blue
      default:
        return Color(0xFFA08B7A); // Warm taupe
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.grey[50]!],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: _shadowAnimation.value,
                    offset: Offset(0, _shadowAnimation.value / 2),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: _getCategoryColor(
                      widget.story.category,
                    ).withOpacity(0.1),
                    blurRadius: _shadowAnimation.value * 2,
                    offset: Offset(0, _shadowAnimation.value),
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Background Pattern
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getCategoryColor(
                            widget.story.category,
                          ).withOpacity(0.02),
                        ),
                      ),
                    ),

                    // Main Content
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          // Image Container with Hero Animation
                          Hero(
                            tag: 'story-${widget.story.id}',
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    _getCategoryColor(
                                      widget.story.category,
                                    ).withOpacity(0.15),
                                    _getCategoryColor(
                                      widget.story.category,
                                    ).withOpacity(0.05),
                                  ],
                                ),
                                border: Border.all(
                                  color: _getCategoryColor(
                                    widget.story.category,
                                  ).withOpacity(0.2),
                                  width: 1.5,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Icon(
                                      _getCategoryIcon(widget.story.category),
                                      size: 36,
                                      color: _getCategoryColor(
                                        widget.story.category,
                                      ).withOpacity(0.6),
                                    ),
                                  ),
                                  // Shimmer effect
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        gradient: LinearGradient(
                                          begin: Alignment(-1.0, -2.0),
                                          end: Alignment(1.0, 2.0),
                                          colors: [
                                            Colors.transparent,
                                            Colors.white.withOpacity(0.15),
                                            Colors.transparent,
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 16),

                          // Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title with gradient text
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [Colors.black87, Colors.black54],
                                  ).createShader(bounds),
                                  child: Text(
                                    widget.story.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 1.2,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                SizedBox(height: 6),

                                // Region with location icon
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      size: 16,
                                      color: _getCategoryColor(
                                        widget.story.category,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        widget.story.region,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: _getCategoryColor(
                                            widget.story.category,
                                          ).withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8),

                                // Description
                                Text(
                                  widget.story.description,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                    height: 1.3,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 12),

                                // Bottom row with duration and category
                                Row(
                                  children: [
                                    // Duration chip
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.access_time_rounded,
                                            size: 14,
                                            color: Colors.grey[600],
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            _formatDuration(
                                              widget.story.duration,
                                            ),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 12),

                                    // Category chip
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            _getCategoryColor(
                                              widget.story.category,
                                            ).withOpacity(0.12),
                                            _getCategoryColor(
                                              widget.story.category,
                                            ).withOpacity(0.06),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: _getCategoryColor(
                                            widget.story.category,
                                          ).withOpacity(0.2),
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        widget.story.category,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: _getCategoryColor(
                                            widget.story.category,
                                          ).withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 12),

                          // Play button with animation
                          AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: _isPressed
                                    ? [
                                        _getCategoryColor(
                                          widget.story.category,
                                        ).withOpacity(0.6),
                                        _getCategoryColor(
                                          widget.story.category,
                                        ).withOpacity(0.4),
                                      ]
                                    : [
                                        _getCategoryColor(
                                          widget.story.category,
                                        ).withOpacity(0.8),
                                        _getCategoryColor(
                                          widget.story.category,
                                        ).withOpacity(0.6),
                                      ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _getCategoryColor(
                                    widget.story.category,
                                  ).withOpacity(0.2),
                                  blurRadius: _isPressed ? 4 : 8,
                                  offset: Offset(0, _isPressed ? 2 : 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Ripple effect overlay
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: widget.onTap,
                          splashColor: _getCategoryColor(
                            widget.story.category,
                          ).withOpacity(0.06),
                          highlightColor: _getCategoryColor(
                            widget.story.category,
                          ).withOpacity(0.03),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'legenda':
        return Icons.auto_stories_rounded;
      case 'dongeng':
        return Icons.child_care_rounded;
      case 'mitos':
        return Icons.psychology_rounded;
      case 'sejarah':
        return Icons.history_edu_rounded;
      default:
        return Icons.menu_book_rounded;
    }
  }
}
