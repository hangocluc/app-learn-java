import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../cubits/quiz_cubit/quiz_cubit.dart';
import '../../cubits/quiz_cubit/quiz_state.dart';
import '../../cubits/chat_cubit/chat_cubit.dart';
import '../../widgets/chat_widget/chat_bottom_sheet.dart';
import '../../../domain/entities/src/lesson/lesson_entity.dart';

class QuizPage extends StatelessWidget {
  final QuizEntity quiz;

  const QuizPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance.get<QuizCubit>()..startQuiz(quiz),
        ),
        BlocProvider(
          create: (context) => GetIt.instance.get<ChatCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(quiz.name),
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizStateLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is QuizStateFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 64, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<QuizCubit>().startQuiz(quiz),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state is QuizStateQuestion) {
              return _buildQuestionView(context, state);
            }

            if (state is QuizStateSummary) {
              return _buildSummaryView(context, state);
            }

            return const Center(child: Text('No quiz data'));
          },
        ),
        floatingActionButton: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is! QuizStateQuestion) return const SizedBox.shrink();
            final question = state.quiz.questions[state.currentQuestionIndex];
            final selectedAnswer =
                state.userAnswers[state.currentQuestionIndex];

            bool isCorrect = false;
            if (selectedAnswer != null) {
              final idx = int.tryParse(question.correctAnswer);
              if (idx != null && idx > 0 && idx <= question.answers.length) {
                isCorrect = selectedAnswer == question.answers[idx - 1];
              } else {
                isCorrect = selectedAnswer.trim().toLowerCase() ==
                    question.correctAnswer.trim().toLowerCase();
              }
            }

            return FloatingActionButton.extended(
              onPressed: () {
                final chatCubit = context.read<ChatCubit>();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => FractionallySizedBox(
                    heightFactor: 0.9,
                    child: BlocProvider.value(
                      value: chatCubit,
                      child: ChatBottomSheet(
                        questionId: question.id,
                        questionText: question.content,
                        isCorrect: isCorrect,
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text('Chat'),
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.white,
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuestionView(BuildContext context, QuizStateQuestion state) {
    final question = state.quiz.questions[state.currentQuestionIndex];
    final selectedAnswer = state.userAnswers[state.currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value:
                (state.currentQuestionIndex + 1) / state.quiz.questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[600]!),
          ),
          const SizedBox(height: 16),

          // Question counter
          Text(
            'Question ${state.currentQuestionIndex + 1} of ${state.quiz.questions.length}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          // Question text
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Text(
              question.content,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Answer options
          Expanded(
            child: ListView.builder(
              itemCount: question.answers.length,
              itemBuilder: (context, index) {
                final answer = question.answers[index];
                final isSelected = selectedAnswer == answer;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => context.read<QuizCubit>().selectAnswer(answer),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue[100] : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue[600]!
                              : Colors.grey[300]!,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.blue[600]
                                  : Colors.grey[300],
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              answer,
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected
                                    ? Colors.blue[800]
                                    : Colors.black87,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Next/Finish button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 16),
            child: ElevatedButton(
              onPressed: selectedAnswer != null
                  ? () => context.read<QuizCubit>().nextQuestion()
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                state.isLastQuestion ? 'Finish Quiz' : 'Next Question',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryView(BuildContext context, QuizStateSummary state) {
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
            'Quiz Completed!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'Your Score: ${state.score.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: state.score >= 70 ? Colors.green[600] : Colors.orange[600],
            ),
          ),
          const SizedBox(height: 8),

          Text(
            '${state.correctAnswers} out of ${state.quiz.questions.length} correct',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 32),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.read<QuizCubit>().restartQuiz(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Retake Quiz'),
                ),
              ),
              const SizedBox(width: 16),
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
                  child: const Text('Back to Lessons'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
