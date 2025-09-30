import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_java/features/presentation/cubits/program_cubit/program_cubit.dart';
import 'package:learn_java/features/presentation/pages/program_page/ui/program_screen.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgramCubit()..getProgram(),
      child: const Scaffold(
        body: SafeArea(child: ProgramScreen()),
      ),
    );
  }
}
