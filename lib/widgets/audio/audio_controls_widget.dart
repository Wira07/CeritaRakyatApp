import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class AudioControlsWidget extends StatelessWidget {
  final bool isPlaying;
  final double playbackSpeed;
  final VoidCallback onPlayPause;
  final VoidCallback onSpeedChange;

  const AudioControlsWidget({
    required this.isPlaying,
    required this.playbackSpeed,
    required this.onPlayPause,
    required this.onSpeedChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {}, // Skip backward
          icon: Icon(Icons.skip_previous),
          color: AppColors.primary,
          iconSize: 32,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onPlayPause,
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            iconSize: 36,
          ),
        ),
        IconButton(
          onPressed: () {}, // Skip forward
          icon: Icon(Icons.skip_next),
          color: AppColors.primary,
          iconSize: 32,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: onSpeedChange,
            child: Text(
              '${playbackSpeed}x',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
