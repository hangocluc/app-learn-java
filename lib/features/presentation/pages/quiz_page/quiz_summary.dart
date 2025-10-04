import 'package:flutter/material.dart';
import '../../cubits/quiz_cubit/quiz_state.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({super.key, required this.state, required this.isFromQuiz});
  final QuizStateSummary state;
  final bool isFromQuiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
// Quiz completed icon
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: state.score >= 70 ? Colors.green[100] : Colors.orange[100],
            ),
            child: Icon(
              state.score >= 70 ? Icons.check_circle : Icons.quiz,
              size: 50,
              color: state.score >= 70 ? Colors.green[600] : Colors.orange[600],
            ),
          ),
          const SizedBox(height: 24),

// Score
          Text(
            'Hoàn thành!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'Điểm của bạn: ${state.score.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: state.score >= 70 ? Colors.green[600] : Colors.orange[600],
            ),
          ),
          const SizedBox(height: 8),

          Text(
            '${state.correctAnswers}/${state.quiz.questions.length} đáp án đúng',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 100),

// Action buttons
          Row(
            children: [
              if (!isFromQuiz) ...[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Học lại'),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
              Expanded(
                child: ElevatedButton(
                  onPressed: isFromQuiz
                      ? () => Navigator.of(context).pop()
                      : () => Navigator.of(context)
                        ..pop()
                        ..pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Quay về trang chủ'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
