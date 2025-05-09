import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/flutter_text_decorator.dart';

class HighlightExampleScreen extends StatelessWidget {
  static const String route = '/highlight-example';
  const HighlightExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Highlight Text Examples')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextDecorator.highlighted(
                text: const Text(
                  'abc',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 32),
              TextDecorator.highlighted(
                text: const Text(
                  'Highlighted Text',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 32),
              TextDecorator.highlighted(
                text: const Text(
                  'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
