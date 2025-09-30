import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_java/common/widget/app_loading_overlay/app_loading_overlay.dart';
import 'package:learn_java/common/widget/app_toast/app_toast.dart';
import 'package:learn_java/features/domain/entities/src/program/program_model.dart';
import 'package:learn_java/features/presentation/cubits/program_cubit/program_cubit.dart';
import 'package:learn_java/features/presentation/pages/program_page/detail_program/detail_program.dart';
import 'package:learn_java/features/presentation/pages/program_page/widget/program_item.dart';

class ListProgram extends StatelessWidget {
  const ListProgram({super.key});

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
              return ProgramItem(
                program: program,
                onTap: () {
                  onItemClick(program, context);
                },
              );
            },
          );
        }
        return const Center(
          child: Text("No programs available"),
        );
      },
    );
  }

  Future<void> onItemClick(ProgramModel program, BuildContext context) async {
    showLoadingOverlay(context);
    final programDetails =
        await context.read<ProgramCubit>().getDetailProgram(program.id);

    if (!context.mounted) return;
    dismissLoadingOverlayDirectly(context);

    if (programDetails != null && programDetails.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => DetailProgram(
            programDetails: programDetails,
            title: program.name,
          ),
        ),
      );
      return;
    }
    showToastError(context, "Something went wrong, please try again later.");
  }
}
