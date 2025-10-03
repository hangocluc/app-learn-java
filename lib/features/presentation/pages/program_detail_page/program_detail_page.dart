import 'package:flutter/material.dart';
import 'package:learn_java/features/data/entities/program_entity/program_entity.dart';
import 'package:learn_java/features/presentation/pages/code_editor_page/code_editor_page.dart';

class ProgramDetailPage extends StatelessWidget {
  final ProgramEntity program;

  const ProgramDetailPage({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(program.name ?? 'Program Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: program.programDetails?.isEmpty == true
          ? const Center(
              child: Text(
                'No examples available',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: program.programDetails?.length ?? 0,
              itemBuilder: (context, index) {
                final detail = program.programDetails![index];
                return _buildExampleCard(context, detail);
              },
            ),
    );
  }

  Widget _buildExampleCard(BuildContext context, ProgramDetailEntity detail) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CodeEditorPage(programDetail: detail),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: 24,
                  color: Colors.green.shade600,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.title ?? 'Untitled Example',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Click to open code editor',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
