import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  // Constructor to accept the score and totalQuestions
  QuizResultScreen({
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Kuis'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.celebration,
              size: 64,
              color: Colors.green[600],
            ),
            SizedBox(height: 16),
            Text(
              'Kuis Selesai!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Skor Anda: $score/$totalQuestions',
              style: TextStyle(
                fontSize: 20,
                color: Colors.brown[600],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Keterangan: ${score / totalQuestions >= 0.7 ? "Selamat! Anda lulus!" : "Cobalah lagi untuk mendapatkan skor yang lebih baik."}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown[500],
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[600],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text('Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }
}
