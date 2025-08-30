import 'package:flutter/material.dart';
import 'package:shop/app_routers.dart';
import 'package:shop/theme/app_theme.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRouters.initialRoute,
      onGenerateRoute: AppRouters.generateRoute,
    );
  }
}
