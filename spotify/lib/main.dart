import 'package:flutter/material.dart';
import 'package:spotify/navigations/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            brightness: Brightness.dark,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                selectedLabelStyle: TextStyle(
                  fontSize: 12,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12,
                ),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white38)),
        home: const Tabbar());
  }
}
