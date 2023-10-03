import 'package:app/home_screen.dart';
import 'package:app/login_page.dart';
import 'package:flutter/material.dart';

class RndvouzApp extends StatelessWidget {
  const RndvouzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rndvouz App',
      initialRoute: '/login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/homescreen': (BuildContext context) => const Homescreen(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
