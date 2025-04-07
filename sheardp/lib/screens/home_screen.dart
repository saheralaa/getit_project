import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheardp/classes.dart';
import 'package:sheardp/screens/login_screen.dart';
import 'package:sheardp/service_locator/di_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final login = getIt<ApiService>();
    final text = login.fetchData();
    final user = getIt<User>();
    final person = getIt<Person>();
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Text('Home Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLogin', false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              
              },
              child: Text('Log out'),
            ),
            SizedBox(height: 30),
            Text(text),
            const SizedBox(height: 20),
            Text(user.fetchData()),
            const SizedBox(height: 20),
            Text(person.fetchData()),
            const SizedBox(height: 19),
          ],
        ),
      ),
    );
  }
}
