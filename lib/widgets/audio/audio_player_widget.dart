import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../services/audio_service.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final VoidCallback? onPlayComplete;

  const AudioPlayerWidget({
    required this.audioUrl,
    this.onPlayComplete,
  });

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  bool isPlaying = false;
  bool isLoading = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration(minutes: 8, seconds: 30);

  final AudioService _audioService = AudioService();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.brown[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.brown[200]!),
      ),
      child: Column(
        children: [
          Text(
            'Audio Player dengan Deep Learning',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(_formatDuration(currentPosition)),
              Expanded(
                child: Slider(
                  value: currentPosition.inSeconds.toDouble(),
                  max: totalDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      currentPosition = Duration(seconds: value.toInt());
                    });
                  },
                  activeColor: Colors.brown[600],
                ),
              ),
              Text(_formatDuration(totalDuration)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  // Rewind 10 seconds
                  setState(() {
                    currentPosition = Duration(
                      seconds: (currentPosition.inSeconds - 10).clamp(0, totalDuration.inSeconds),
                    );
                  });
                },
                icon: Icon(Icons.replay_10),
                iconSize: 32,
              ),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown[600],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: isLoading ? null : _togglePlayPause,
                  icon: isLoading
                      ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  iconSize: 32,
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  // Forward 10 seconds
                  setState(() {
                    currentPosition = Duration(
                      seconds: (currentPosition.inSeconds + 10).clamp(0, totalDuration.inSeconds),
                    );
                  });
                },
                icon: Icon(Icons.forward_10),
                iconSize: 32,
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.brown[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.psychology,
                  color: Colors.brown[700],
                  size: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Deep Learning menganalisis intonasi dan kecepatan bicara untuk memberikan umpan balik pembelajaran yang optimal.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.brown[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _togglePlayPause() {
    setState(() {
      if (isPlaying) {
        isPlaying = false;
      } else {
        isLoading = true;
        // Simulate loading
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            isLoading = false;
            isPlaying = true;
          });
          _startPlayback();
        });
      }
    });
  }

  void _startPlayback() {
    // Simulate audio playback
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPlaying) {
        setState(() {
          currentPosition = Duration(seconds: currentPosition.inSeconds + 1);
          if (currentPosition >= totalDuration) {
            isPlaying = false;
            timer.cancel();
            if (widget.onPlayComplete != null) {
              widget.onPlayComplete!();
            }
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
