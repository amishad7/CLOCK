import 'package:flutter/material.dart';
import 'package:time/clock.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const clock(),
      },
    ),
  );
}
