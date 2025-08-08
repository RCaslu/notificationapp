import 'package:flutter/material.dart';

class SocPage extends StatelessWidget {
  const SocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOC Page'),
      ),
      body: Center(
        child: const Text('Welcome to the SOC page!'),
      ),
    );
  }
}