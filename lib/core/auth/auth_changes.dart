import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grid/features/authentication/presentation/login_screen/login.dart';
import 'package:grid/features/home/presentation/home_feed_screen.dart';

class AuthChanges extends StatelessWidget {
  const AuthChanges({super.key});

  @override
  Widget build(BuildContext context) {
    //final _authChange = FirebaseAuth.instance.authStateChanges();
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return const HomeFeed();
        } else {
          return const Login();
        }
      },
    );
  }
}
