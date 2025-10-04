import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('NotFoundPage'),
        ),
        body: Center(
          child: Text('NotFoundPage'),
        ),
      ),
    );
  }
}
