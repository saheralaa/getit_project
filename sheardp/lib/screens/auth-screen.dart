import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheardp/screens/home_screen.dart';
import 'package:sheardp/screens/login_screen.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});
  bool isLogin = false;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    if (isLogin) {
      setState(() {
        widget.isLogin = true;
      });
    } else {
      setState(() {
        widget.isLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLogin ? HomeScreen() : LoginScreen();
  }
}
