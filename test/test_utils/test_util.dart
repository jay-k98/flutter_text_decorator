import 'package:flutter/material.dart';

const testText = 'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin';

Widget createTestApp(Widget child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: child),
    );
