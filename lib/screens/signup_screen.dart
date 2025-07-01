import 'package:flutter/material.dart';
import 'package:shop/screens/home_page.dart';
import 'package:shop/screens/login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String id = 'signupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب')),
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
                  child: const Text('تسجيل'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.id);
                  },
                  child: const Text('لديك حساب؟ سجل دخول'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
