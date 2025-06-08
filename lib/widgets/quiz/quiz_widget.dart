import 'package:flutter/material.dart';
import '../../models/quiz_model.dart';
import '../../models/story_model.dart';

class QuizWidget extends StatefulWidget {
  final String storyId;
  final Function(int) onQuizComplete;

  const QuizWidget({
    required this.storyId,
    required this.onQuizComplete,
  });

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswer;
  bool showResult = false;

  final List<QuizQuestion> questions = [
    QuizQuestion(
      id: '1', // Unique identifier for the question
      storyId: '1', // This would be the storyId from the widget
      question: 'Apa pesan moral utama dari cerita yang Anda dengar?',
      options: [
        'Pentingnya berbakti kepada orang tua',
        'Kekayaan adalah segalanya',
        'Kesombongan itu baik',
        'Melupakan asal usul tidak masalah'
      ],
      correctAnswer: 0,
      explanation: 'Pesan moral cerita ini adalah pentingnya berbakti kepada orang tua.',
    ),
    QuizQuestion(
      id: '2',
      storyId: '1',
      question: 'Dari daerah mana cerita ini berasal?',
      options: [
        'Jawa Barat',
        'Sumatera Barat',
        'Kalimantan',
        'Sulawesi'
      ],
      correctAnswer: 1,
      explanation: 'Cerita ini berasal dari Sumatera Barat.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.quiz,
                color: Colors.blue[700],
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Kuis Pemahaman',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          if (!showResult) ...[
            Text(
              'Pertanyaan ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              questions[currentQuestionIndex].question,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            ...questions[currentQuestionIndex].options.asMap().entries.map(
                  (entry) {
                int index = entry.key;
                String option = entry.value;
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: RadioListTile<int>(
                    title: Text(option),
                    value: index,
                    groupValue: selectedAnswer,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                      });
                    },
                    activeColor: Colors.blue[600],
                  ),
                );
              },
            ).toList(),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedAnswer != null ? _nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  currentQuestionIndex < questions.length - 1 ? 'Selanjutnya' : 'Selesai',
                ),
              ),
            ),
          ] else ...[
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.celebration,
                    size: 64,
                    color: Colors.blue[600],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Kuis Selesai!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Skor Anda: $score/${questions.length}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _nextQuestion() {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      score++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        showResult = true;
      });
      widget.onQuizComplete(score);
    }
  }
}
