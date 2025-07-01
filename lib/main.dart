import 'package:flutter/material.dart';
import 'package:shop/screens/home_page.dart';
import 'package:shop/screens/update_product_page.dart';
import 'package:shop/screens/login_screen.dart';
import 'package:shop/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StoreApp());
}

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFF181829),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF23234A),
          foregroundColor: Colors.deepPurpleAccent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
          ),
        ),
      ),
      themeMode: _themeMode,
      routes: {
        HomePage.id:
            (context) =>
                HomePage(onToggleTheme: _toggleTheme, themeMode: _themeMode),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
      },
      home: FutureBuilder<dynamic>(
        future: Future.value(
          null,
        ), // Replace with your actual user future if available
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          // For now, always show LoginScreen since we don't have a user type
          return const LoginScreen();
        },
      ),
    );
  }
}
