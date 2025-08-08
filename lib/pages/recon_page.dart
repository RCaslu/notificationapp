import 'package:flutter/material.dart';

class ReconPage extends StatelessWidget {
  const ReconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recon Page'),
      ),
      body: Center(
        child: const Text('Welcome to the Recon page!'),
      ),
    );
  }
}