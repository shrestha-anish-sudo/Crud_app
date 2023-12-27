import 'package:crud_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crud_app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('SQLite Crud'),
          ),
          body: HomeScreen(),
        ));
  }
}
