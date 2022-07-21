import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/screens/login.dart';

// import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store By Paula Saraiva',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromARGB(255, 4, 125, 141),
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
