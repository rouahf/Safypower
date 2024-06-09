import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'Loginpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'SafyPower',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A8A),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1E3A8A),
          secondary: const Color(0xFF10B981),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF1E3A8A),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1E3A8A),
        colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
          primary: const Color(0xFF1E3A8A),
          secondary: const Color(0xFF10B981),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      themeMode: themeProvider.themeMode,
      home: const LoginPage(),
    );
  }
}
