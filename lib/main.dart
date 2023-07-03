import 'package:flutter/material.dart';
import 'package:saccos/registration/forgotPassword.dart';
import 'package:saccos/registration/registerPage.dart';

import 'home/home.dart';
import 'loan/loanAppy.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/fpass': (context) => const ForgotPasswordPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/payment': (context) => const LoanProcess(),
      },
    );
  }
}
