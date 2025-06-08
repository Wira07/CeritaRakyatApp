import 'package:flutter/material.dart';
import 'dart:math';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String category;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.category,
  });
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  bool isAnswered = false;
  bool showExplanation = false;
  bool quizCompleted = false;

  late AnimationController _animationController;
  late AnimationController _progressController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _progressAnimation;

  final List<QuizQuestion> questions = [
    QuizQuestion(
      question: "Siapa nama tokoh utama dalam cerita Malin Kundang?",
      options: ["Malin Kundang", "Sangkuriang", "Timun Mas", "Bawang Merah"],
      correctAnswerIndex: 0,
      explanation: "Malin Kundang adalah tokoh utama yang menjadi anak durhaka dalam legenda dari Sumatera Barat.",
      category: "Legenda",
    ),
    QuizQuestion(
      question: "Dari daerah mana asal cerita Sangkuriang?",
      options: ["Sumatera Barat", "Jawa Tengah", "Jawa Barat", "Bali"],
      correctAnswerIndex: 2,
      explanation: "Sangkuriang adalah legenda dari Jawa Barat yang menceritakan terbentuknya Gunung Tangkuban Perahu.",
      category: "Legenda",
    ),
    QuizQuestion(
      question: "Apa yang digunakan Timun Mas untuk melawan raksasa?",
      options: ["Pedang", "Benda-benda ajaib", "Panah", "Tombak"],
      correctAnswerIndex: 1,
      explanation: "Timun Mas menggunakan biji mentimun, jarum, garam, dan terasi yang diberikan nenek sihir.",
      category: "Dongeng",
    ),
    QuizQuestion(
      question: "Pesan moral utama dari cerita Malin Kundang adalah?",
      options: [
        "Jangan sombong dengan kekayaan",
        "Berbakti kepada orang tua",
        "Kerja keras membawa hasil",
        "Persahabatan itu penting"
      ],
      correctAnswerIndex: 1,
      explanation: "Cerita Malin Kundang mengajarkan pentingnya berbakti kepada orang tua dan tidak melupakan asal-usul.",
      category: "Nilai Moral",
    ),
    QuizQuestion(
      question: "Siapa ibu dari Sangkuriang dalam legenda Jawa Barat?",
      options: ["Dayang Sumbi", "Dewi Sri", "Nyi Roro Kidul", "Dewi Ratih"],
      correctAnswerIndex: 0,
      explanation: "Dayang Sumbi adalah ibu dari Sangkuriang yang awet muda karena memiliki kesaktian.",
      category: "Legenda",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _progressController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    _animationController.forward();
    _progressController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  void _selectAnswer(int index) {
    if (isAnswered) return;

    setState(() {
      selectedAnswerIndex = index;
      isAnswered = true;
      if (index == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });

    // Show explanation after a brief delay
    Future.delayed(Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          showExplanation = true;
        });
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isAnswered = false;
        showExplanation = false;
      });
      _animationController.reset();
      _animationController.forward();
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswerIndex = null;
      score = 0;
      isAnswered = false;
      showExplanation = false;
      quizCompleted = false;
    });
    _animationController.reset();
    _animationController.forward();
    _progressController.reset();
    _progressController.forward();
  }

  Color _getScoreColor() {
    double percentage = (score / questions.length) * 100;
    if (percentage >= 80) return Colors.green;
    if (percentage >= 60) return Colors.orange;
    return Colors.red;
  }

  String _getScoreMessage() {
    double percentage = (score / questions.length) * 100;
    if (percentage >= 80) return "Luar Biasa! 🎉";
    if (percentage >= 60) return "Bagus! 👏";
    return "Tetap Semangat! 💪";
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return _buildResultScreen();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Kuis Cerita Rakyat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown[700],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                '${currentQuestionIndex + 1}/${questions.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Container(
            height: 6,
            child: AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: ((currentQuestionIndex + 1) / questions.length) * _progressAnimation.value,
                  backgroundColor: Colors.brown[100],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.brown[700]!),
                );
              },
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _slideAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category Badge
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.brown[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              questions[currentQuestionIndex].category,
                              style: TextStyle(
                                color: Colors.brown[700],
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          // Question Card
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.brown[600]!, Colors.brown[800]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown.withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.quiz,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  questions[currentQuestionIndex].question,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.4,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30),

                          // Answer Options
                          ...questions[currentQuestionIndex].options.asMap().entries.map(
                                (entry) {
                              int index = entry.key;
                              String option = entry.value;
                              bool isSelected = selectedAnswerIndex == index;
                              bool isCorrect = index == questions[currentQuestionIndex].correctAnswerIndex;

                              Color cardColor = Colors.white;
                              Color textColor = Colors.grey[800]!;
                              IconData? icon;

                              if (isAnswered) {
                                if (isCorrect) {
                                  cardColor = Colors.green[50]!;
                                  textColor = Colors.green[800]!;
                                  icon = Icons.check_circle;
                                } else if (isSelected && !isCorrect) {
                                  cardColor = Colors.red[50]!;
                                  textColor = Colors.red[800]!;
                                  icon = Icons.cancel;
                                }
                              } else if (isSelected) {
                                cardColor = Colors.brown[50]!;
                                textColor = Colors.brown[800]!;
                              }

                              return Container(
                                margin: EdgeInsets.only(bottom: 12),
                                child: Material(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(15),
                                  elevation: isSelected ? 8 : 2,
                                  shadowColor: Colors.brown.withOpacity(0.2),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: () => _selectAnswer(index),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: isAnswered && isCorrect
                                              ? Colors.green
                                              : isAnswered && isSelected && !isCorrect
                                              ? Colors.red
                                              : isSelected
                                              ? Colors.brown[300]!
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: textColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                String.fromCharCode(65 + index), // A, B, C, D
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: textColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Text(
                                              option,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: textColor,
                                              ),
                                            ),
                                          ),
                                          if (icon != null) ...[
                                            SizedBox(width: 12),
                                            Icon(
                                              icon,
                                              color: isCorrect ? Colors.green : Colors.red,
                                              size: 24,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),

                          SizedBox(height: 20),

                          // Explanation Card
                          if (showExplanation)
                            AnimatedOpacity(
                              opacity: showExplanation ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.blue[200]!),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.lightbulb,
                                          color: Colors.blue[700],
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Penjelasan',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue[700],
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      questions[currentQuestionIndex].explanation,
                                      style: TextStyle(
                                        color: Colors.blue[800],
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          SizedBox(height: 30),

                          // Next Button
                          if (isAnswered)
                            Container(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: _nextQuestion,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      currentQuestionIndex < questions.length - 1
                                          ? 'SOAL BERIKUTNYA'
                                          : 'LIHAT HASIL',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      currentQuestionIndex < questions.length - 1
                                          ? Icons.arrow_forward
                                          : Icons.assessment,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultScreen() {
    double percentage = (score / questions.length) * 100;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Hasil Kuis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown[700],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Result Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_getScoreColor().withOpacity(0.1), _getScoreColor().withOpacity(0.05)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: _getScoreColor().withOpacity(0.3), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: _getScoreColor().withOpacity(0.2),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: 80,
                      color: _getScoreColor(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _getScoreMessage(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: _getScoreColor(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Skor Anda',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '$score/${questions.length}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: _getScoreColor(),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: _getScoreColor(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        percentage >= 80
                            ? 'Anda memiliki pengetahuan yang sangat baik tentang cerita rakyat Indonesia!'
                            : percentage >= 60
                            ? 'Pengetahuan Anda tentang cerita rakyat cukup baik. Terus belajar!'
                            : 'Mari pelajari lebih banyak cerita rakyat Indonesia yang menarik!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: _restartQuiz,
                        icon: Icon(Icons.refresh, color: Colors.white),
                        label: Text(
                          'ULANGI KUIS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 55,
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.home, color: Colors.brown[700]),
                        label: Text(
                          'KEMBALI',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[700],
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.brown[700]!, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}