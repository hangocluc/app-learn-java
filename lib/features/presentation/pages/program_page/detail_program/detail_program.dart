import 'package:flutter/material.dart';
import 'package:learn_java/features/domain/entities/src/program/program_detail.dart';

class DetailProgram extends StatelessWidget {
  const DetailProgram(
      {super.key, required this.programDetails, required this.title});

  final List<ProgramDetail> programDetails;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (ctx, index) => _buildItem(programDetails[index]),
        itemCount: programDetails.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
      ),
    );
  }

  Widget _buildItem(ProgramDetail programDetail) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(12)),
      child: Text(programDetail.title),
    );
  }
}
