import 'package:flutter/material.dart';
import '../../../domain/entities/src/lesson/lesson_entity.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key, required this.lesson, required this.onTap});
  final LessonEntity lesson;
  final VoidCallback onTap;

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final topics = widget.lesson.topics;
    final isLast = currentIndex == topics.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StepperWithArrows(
              topicCount: topics.length,
              currentIndex: currentIndex,
              onStepTap: (idx) {
                setState(() {
                  currentIndex = idx;
                });
              },
            ),
            const SizedBox(height: 20),
            // Readable topic card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topics[currentIndex].title ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      topics[currentIndex].content ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.7,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: isLast
                      ? ElevatedButton.icon(
                          onPressed: widget.onTap,
                          icon: const Icon(Icons.quiz, color: Colors.white),
                          label: const Text('Làm Quiz',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentIndex++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Tiếp tục',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                ),
              ],
            ),
            SizedBox(height: 8),
            !isLast
                ? TextButton(
                    onPressed: widget.onTap,
                    child: const Text(
                      'Làm Quiz',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 8,
                  )
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}

class StepperWithArrows extends StatefulWidget {
  final int topicCount;
  final int currentIndex;
  final Function(int) onStepTap;

  const StepperWithArrows({
    super.key,
    required this.topicCount,
    required this.currentIndex,
    required this.onStepTap,
  });

  @override
  State<StepperWithArrows> createState() => _StepperWithArrowsState();
}

class _StepperWithArrowsState extends State<StepperWithArrows> {
  final ScrollController _controller = ScrollController();

  void scrollToIndex(int idx) {
    _controller.animateTo(
      idx * 70.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(covariant StepperWithArrows oldWidget) {
    super.didUpdateWidget(oldWidget);
    // scrollToIndex(widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: widget.currentIndex > 0
              ? () => widget.onStepTap(widget.currentIndex - 1)
              : null,
        ),
        Expanded(
          child: SizedBox(
            height: 60,
            child: ListView.separated(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.topicCount,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, idx) {
                final isActive = idx == widget.currentIndex;
                return GestureDetector(
                  onTap: () => widget.onStepTap(idx),
                  child: Column(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color:
                              isActive ? Colors.blueAccent : Colors.grey[300],
                          shape: BoxShape.circle,
                          boxShadow: isActive
                              ? [
                                  BoxShadow(
                                      color: Colors.blueAccent.withOpacity(0.2),
                                      blurRadius: 6)
                                ]
                              : [],
                        ),
                        child: Center(
                          child: Text(
                            '${idx + 1}',
                            style: TextStyle(
                              color: isActive ? Colors.white : Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        width: 60,
                        child: Text(
                          'Topic ${idx + 1}',
                          style: TextStyle(
                            fontSize: 10,
                            color:
                                isActive ? Colors.blueAccent : Colors.black54,
                            fontWeight:
                                isActive ? FontWeight.bold : FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 18),
          onPressed: widget.currentIndex < widget.topicCount - 1
              ? () => widget.onStepTap(widget.currentIndex + 1)
              : null,
        ),
      ],
    );
  }
}
