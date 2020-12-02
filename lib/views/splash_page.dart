import 'package:catch_cow_app/views/cows_page.dart';
import 'package:catch_cow_app/views/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_core/firebase_core.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateToPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/Preloader_1.gif'),
      ),
    );
  }

  void navigateToPage() async {
    final bool isLoggedIn = Auth.FirebaseAuth.instance.currentUser != null;
    // nullでなければtrue
    await Future<void>.delayed(const Duration(seconds: 1));
    // この1行が大事
    if (isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CowsPage();
          },
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }
}

// class createRandomNumber {
//   int min = 1;
//   int max = 5;
//   return Math.Random();
// }
