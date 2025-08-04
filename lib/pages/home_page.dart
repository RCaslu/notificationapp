import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class HomePage extends StatelessWidget {
  final FirebaseAnalytics analytics;

  const HomePage({super.key, required this.analytics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const Text('Welcome to the Home Page!'),
          ElevatedButton(
            onPressed: () {
              analytics.logEvent(name: 'go_to_new_page_clicked');
              Navigator.pushNamed(context, '/new');
            },
            child: const Text('Go to New Page'),
          ),
        ],
      ),
    );
  }
}
