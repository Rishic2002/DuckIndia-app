import 'package:duckindia_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Duck India',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomeScreen());
  }
}
