import 'package:flutter/material.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Program Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
