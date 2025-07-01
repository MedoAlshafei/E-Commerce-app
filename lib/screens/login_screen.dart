import 'package:flutter/material.dart';
import 'package:shop/screens/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = 'loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'البريد الإلكتروني',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'كلمة المرور'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: const Text('تسجيل الدخول'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.id);
                  },
                  child: const Text('ليس لديك حساب؟ سجل الآن'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
