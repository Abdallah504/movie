import 'package:flutter/material.dart';
import 'package:movie/screens/home_screen.dart';

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
      
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primaryColor: Colors.green,
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: HomeScreen(),
    );
  }
}

