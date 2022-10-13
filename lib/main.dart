import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Screens/screens.dart';
import 'package:flutter_chat_app/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.dark,
      title: 'Chatter',
      home: const HomeScreen(),
    );
  }
}
