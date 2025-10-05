import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_java/features/data/entities/program_entity/program_entity.dart';
import 'package:learn_java/features/data/services/compiler_service.dart';
import 'package:learn_java/features/presentation/cubits/compiler_cubit/compiler_cubit.dart';
import 'package:learn_java/features/presentation/widgets/code_editor_widget.dart';

class CodeEditorPage extends StatefulWidget {
  final ProgramDetailEntity programDetail;

  const CodeEditorPage({
    Key? key,
    required this.programDetail,
  }) : super(key: key);

  @override
  State<CodeEditorPage> createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditorPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CompilerCubit(compilerService: GetIt.instance.get<CompilerService>()),
      child: CompilerScreen(programDetail:widget.programDetail),
    );
  }
}

class CompilerScreen extends StatefulWidget {
  const CompilerScreen({super.key, required this.programDetail});
  final ProgramDetailEntity programDetail;

  @override
  State<CompilerScreen> createState() => _CompilerScreenState();
}

class _CompilerScreenState extends State<CompilerScreen> {

  late String _currentCode;
  bool _isEdited = false;

  @override
  void initState() {
    super.initState();
    _currentCode = _wrapInMainMethod(widget.programDetail.content ?? '');
  }

  String _wrapInMainMethod(String content) {
    return '''public class JavaStudio {
    public static void main(String[] args) {
        $content
    }
}''';
  }

  void _onCodeChanged(String code) {
    setState(() {
      _currentCode = code;
      _isEdited = true;
    });
  }

  void _runCode() {
    context.read<CompilerCubit>().compileAndRun(_currentCode);
  }

  void _formatCode() {
    context.read<CompilerCubit>().formatCode(_currentCode);
  }

  void _showOutputDialog(String output) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Output'),
        content: SingleChildScrollView(
          child: Text(
            output,
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.programDetail.title ?? 'Code Editor'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.format_align_left),
            onPressed: _formatCode,
            tooltip: 'Format Code',
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: _runCode,
            tooltip: 'Run Code',
          ),
        ],
      ),
      body: BlocListener<CompilerCubit, CompilerCubitState>(
        listener: (context, state) {
          if (state is CompilerCubitSuccess) {
            _showOutputDialog(state.output);
          } else if (state is CompilerCubitError) {
            _showOutputDialog('Error: ${state.error}');
          } else if (state is CompilerCubitFormatted) {
            setState(() {
              _currentCode = state.formattedCode;
              _isEdited = true;
            });
          }
        },
        child: Column(
          children: [
            if (_isEdited)
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.orange.shade100,
                child: const Text(
                  'Code has been modified',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            BlocBuilder<CompilerCubit, CompilerCubitState>(
              builder: (context, state) {
                if (state is CompilerCubitCompiling) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    color: Colors.blue.shade100,
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Compiling and running...',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CodeEditorWidget(
                  initialCode: _currentCode,
                  onCodeChanged: _onCodeChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
