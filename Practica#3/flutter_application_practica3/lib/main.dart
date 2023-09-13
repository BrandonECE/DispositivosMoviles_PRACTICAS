import 'package:flutter/material.dart';
import 'body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_Practica#3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange, primary: Colors.orangeAccent.shade400),
        useMaterial3: true,
      ),
      home: const myBody(title: 'Conversión de temperatura'),
    );
  }
}
