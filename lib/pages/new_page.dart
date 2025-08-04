import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class NewPage extends StatelessWidget {
  final FirebaseAnalytics analytics;

  const NewPage({super.key, required this.analytics});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Page'),
        ),
        body: Column(
          children: [
            const Text('This is a new page!'),
            ElevatedButton(
              onPressed: () {
                analytics.logEvent(name: 'go_back_clicked');
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
