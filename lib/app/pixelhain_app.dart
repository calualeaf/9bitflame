import 'package:bitflame/game/pixelhain_screen.dart';
import 'package:flutter/material.dart';

class PixelhainApp extends StatelessWidget {
  const PixelhainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Der Pixelhain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff72ffb6),
          brightness: Brightness.dark,
        ),
        fontFamily: 'monospace',
        useMaterial3: true,
      ),
      home: const PixelhainScreen(),
    );
  }
}
