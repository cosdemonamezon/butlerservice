import 'package:butlerservice/screens/auth/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('th'),
        ],
        locale: const Locale('th'),
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
        home: LoginPage(),
      ),
    );
  }
}
