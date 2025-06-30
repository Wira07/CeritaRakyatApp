import 'package:flutter/material.dart';
import '../models/story_model.dart';
import '../widgets/audio/audio_player_widget.dart';
import '../widgets/quiz/quiz_widget.dart';
import '../widgets/story/story_content_widget.dart';
import '../widgets/story/wisdom_card_widget.dart';

class StoryDetailScreen extends StatefulWidget {
  final Story story;

  StoryDetailScreen({required this.story});

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  bool showQuiz = false;
  bool isAudioCompleted = false; // Track if the audio has finished

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story.title),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoryContentWidget(story: widget.story),
            AudioPlayerWidget(
              audioUrl: widget.story.audioUrl,
              onPlayComplete: () {
                setState(() {
                  isAudioCompleted = true;  // Set to true when audio finishes
                });
              },
            ),
            WisdomCardWidget(wisdom: widget.story.wisdom),
            // Show "Start Quiz" button only when the audio is completed
            if (isAudioCompleted)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showQuiz = true; // Show quiz when button is pressed
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600], // Use backgroundColor instead of primary
                    foregroundColor: Colors.white,      // Use foregroundColor instead of onPrimary
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text('Start Quiz'),
                ),
              ),
            // Show the quiz once the button is pressed
            if (showQuiz)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: QuizWidget(
                  storyId: widget.story.id,
                  onQuizComplete: (score) {
                    _showScoreDialog(score);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showScoreDialog(int score) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hasil Kuis'),
        content: Text('Skor Anda: $score/10'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
