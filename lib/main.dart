import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          elevation: 0,
          //backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            //color: Colors.white,
            fontFamily: 'Prompt',
            fontSize: 16,
            //fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Prompt',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //backgroundColor: Colors.white,
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   secondary: Colors.white, // Your accent color
        // ),
        useMaterial3: true,
      ),
      home: FirstPage(),
    );
  }
}
