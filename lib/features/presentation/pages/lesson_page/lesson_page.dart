import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_java/common/app_shared_preferences/app_shared_preferences.dart';
import 'package:learn_java/common/app_shared_preferences/app_shared_preferences_key.dart';
import 'package:learn_java/features/data/models/lesson_model/progress_request_model.dart';
import 'package:learn_java/features/data/providers/lesson_service/lesson_service.dart';
import 'package:learn_java/main.dart';
import '../../cubits/lesson_cubit/lesson_cubit.dart';
import '../../cubits/lesson_cubit/lesson_state.dart';
import 'package:learn_java/features/domain/entities/src/lesson/lesson_entity.dart';
import '../quiz_page/quiz_page.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late final LessonService _lessonService;
  late final AppSharedPreferences _sharedPreferences;

  @override
  void initState() {
    super.initState();
    _lessonService = sl.get<LessonService>();
    _sharedPreferences = sl.get<AppSharedPreferences>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LessonCubit>().loadLessons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
      ),
      body: BlocBuilder<LessonCubit, LessonState>(
        builder: (context, state) {
          if (state is LessonStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LessonStateFailure) {
            return Center(child: Text(state.message));
          }
          if (state is LessonStateSuccess) {
            return _buildList(state.lessons);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildList(List<LessonEntity> lessons) {
    if (lessons.isEmpty) {
      return const Center(child: Text('No lessons'));
    }
    return ListView.separated(
      itemCount: lessons.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) {
        final item = lessons[index];
        return ListTile(
          title: Text(item.title),
          subtitle:
              Text('Topics: ${item.totalTopic} • Learned: ${item.learnCount}'),
          leading: CircleAvatar(child: Text('${index + 1}')),
          trailing: item.quiz != null
              ? IconButton(
                  icon: const Icon(Icons.quiz),
                  onPressed: () => _startQuiz(context, item.quiz!),
                )
              : null,
          onTap:
              item.quiz != null ? () => _startQuiz(context, item.quiz!) : null,
        );
      },
    );
  }

  void _startQuiz(BuildContext context, QuizEntity quiz) {
    _markLessonStarted(quiz.lessonId);
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => QuizPage(quiz: quiz),
      ),
    )
        .then((_) {
      if (mounted) {
        context.read<LessonCubit>().loadLessons();
      }
    });
  }

  Future<void> _markLessonStarted(String lessonId) async {
    try {
      final String? userId =
          _sharedPreferences.get(AppSharedPreferencesKey.userId) as String?;
      if (userId == null || userId.isEmpty) return;
      final request = ProgressRequestModel(
        userId: userId,
        lessonId: lessonId,
        status: 0, // learning
        quizStatus: 0, // quiz not finished yet
      );
      await _lessonService.updateProcess(request);
    } catch (_) {}
  }
}
