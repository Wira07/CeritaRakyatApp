import 'package:flutter/material.dart';
import '../../utils/colors.dart';  // Assuming you have a file that defines your color constants

class AnswerWidget extends StatelessWidget {
  final String option;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerWidget({
    required this.option,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,  // Call onTap when the user selects an answer
        borderRadius: BorderRadius.circular(8),  // Rounded corners for the InkWell
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.accent.withOpacity(0.1) : Colors.white,  // Highlight color when selected
            borderRadius: BorderRadius.circular(8),  // Rounded corners for the container
            border: Border.all(
              color: isSelected ? AppColors.accent : Colors.grey[300]!,  // Border color based on selection
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              // Checkmark icon if the answer is selected
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? AppColors.accent : Colors.grey[600],  // Change color when selected
                size: 24,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  option,  // The option text
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? AppColors.accent : Colors.black87,  // Change text color when selected
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
