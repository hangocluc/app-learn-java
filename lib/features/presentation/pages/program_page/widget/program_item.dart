import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learn_java/features/domain/entities/program_model.dart';

class ProgramItem extends StatelessWidget {
  const ProgramItem({super.key, required this.program});

  final ProgramModel program;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade300)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: program.image,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
              child: Image.asset(
                "assets/pngs/img_no_image.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                program.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
