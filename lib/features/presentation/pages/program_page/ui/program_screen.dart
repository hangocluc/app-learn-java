import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_java/features/presentation/cubits/program_cubit/program_cubit.dart';
import 'package:learn_java/features/presentation/pages/program_page/widget/program_item.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramCubit, ProgramState>(
      builder: (context, state) {
        if (state is ProgramStateInitial) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is ProgramStateSuccess) {
          final programs = state.programs;
          if (programs.isEmpty) {
            return const Center(
              child: Text('No programs available'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
            ),
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final program = programs[index];
              return ProgramItem(program: program);
            },
          );
        }
        return const Center(
          child: Text("No programs available"),
        );
      },
    );
  }
}
