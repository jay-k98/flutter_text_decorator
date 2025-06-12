import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/flutter_text_decorator.dart';

class UnderlineExampleScreen extends StatelessWidget {
  static const String route = '/underline-example';
  const UnderlineExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Underline Text Examples')),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextDecorator.underlined(
                text: const Text(
                  'Underlined Text',
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.orange,
                strokeWidth: 2,
              ),
            ),
            Center(
              child: TextDecorator.underlined(
                style: UnderlineStyle.curved,
                text: const Text(
                  'Underlined',
                  style: TextStyle(fontSize: 32),
                ),
                color: Colors.red,
                strokeWidth: 2,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: TextDecorator.underlined(
                style: UnderlineStyle.horizontal,
                text: const Text(
                  'Franz jagt im komplett verwahrlosten Taxiiii quer Franz jagt im kompletr Franz jagt im kompletr Franz jagt im jagt im kompletr Franz jagt im',
                  style: TextStyle(fontSize: 16),
                ),
                color: Colors.red,
                strokeWidth: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
