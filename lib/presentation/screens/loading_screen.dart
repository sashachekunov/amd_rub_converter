import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.amber[50],
        body: const Center(
          child: CircularProgressIndicator(color: Colors.yellow),
        ),
      );
}
