import 'package:flutter/material.dart';
import '../../models/quiz_model.dart';
import '../../utils/colors.dart';
import 'answer_widget.dart';

class QuestionWidget extends StatelessWidget {
  final QuizQuestion question;
  final int? selectedAnswer;
  final Function(int) onAnswerSelected;

  const QuestionWidget({
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 16),
        ...question.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return AnswerWidget(
            option: option,
            index: index,
            isSelected: selectedAnswer == index,
            onTap: () => onAnswerSelected(index),
          );
        }).toList(),
      ],
    );
  }
}