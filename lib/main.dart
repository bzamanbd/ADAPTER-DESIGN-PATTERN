import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'adapter dp2',
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.orange,
    ),
    home: const HomeScreen(),
  ));
}
