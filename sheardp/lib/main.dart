import 'package:flutter/material.dart';
import 'package:sheardp/screens/auth-screen.dart';
import 'package:sheardp/service_locator/di_container.dart';

void main() {
  runApp(const MyApp());
  DependancyInjection().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
