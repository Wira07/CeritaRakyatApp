
// lib/widgets/audio/audio_progress_widget.dart
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class AudioProgressWidget extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final Function(Duration) onSeek;

  const AudioProgressWidget({
    required this.currentPosition,
    required this.totalDuration,
    required this.onSeek,
  });

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.primaryLight.withOpacity(0.3),
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withOpacity(0.2),
          ),
          child: Slider(
            value: currentPosition.inSeconds.toDouble(),
            max: totalDuration.inSeconds.toDouble(),
            onChanged: (value) {
              onSeek(Duration(seconds: value.toInt()));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(currentPosition),
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                ),
              ),
              Text(
                _formatDuration(totalDuration),
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
