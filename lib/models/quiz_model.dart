class QuizQuestion {
  final String id;
  final String storyId;
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String explanation;
  final QuestionType type;

  QuizQuestion({
    required this.id,
    required this.storyId,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
    this.type = QuestionType.multipleChoice,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storyId': storyId,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'explanation': explanation,
      'type': type.toString(),
    };
  }

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      storyId: json['storyId'],
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
      explanation: json['explanation'],
      type: QuestionType.values.firstWhere(
            (e) => e.toString() == json['type'],
        orElse: () => QuestionType.multipleChoice,
      ),
    );
  }
}

enum QuestionType {
  multipleChoice,
  trueFalse,
  shortAnswer,
}

class QuizResult {
  final String id;
  final String storyId;
  final int score;
  final int totalQuestions;
  final Duration timeSpent;
  final List<UserAnswer> answers;
  final DateTime completedAt;

  QuizResult({
    required this.id,
    required this.storyId,
    required this.score,
    required this.totalQuestions,
    required this.timeSpent,
    required this.answers,
    DateTime? completedAt,
  }) : completedAt = completedAt ?? DateTime.now();

  double get percentage => (score / totalQuestions) * 100;
  bool get isPassed => percentage >= 70;
}

class UserAnswer {
  final String questionId;
  final int selectedAnswer;
  final bool isCorrect;
  final Duration timeSpent;

  UserAnswer({
    required this.questionId,
    required this.selectedAnswer,
    required this.isCorrect,
    required this.timeSpent,
  });
}
