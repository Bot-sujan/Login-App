import 'package:admin_user_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = '';
  var password = '';

  @override
  void initState() {
    super.initState();
    showData();
  }

  void showData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    password = sp.getString('password') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email'),
                Text(email.toString()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Password'),
                Text(password.toString()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
                InkWell(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.remove('email');
                sp.remove('password');
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.greenAccent,
                child: const Center(child: Text('LogOut!')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
