import 'dart:developer';
import 'dart:io';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/controllers/appController.dart';
import 'package:butlerservice/screens/auth/loginPage.dart';
import 'package:butlerservice/screens/auth/loginPage1.dart';
import 'package:butlerservice/screens/home/firstPage.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: CalendarControllerProvider(
        controller: EventController(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppController()),
          ],
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
              appBarTheme: AppBarTheme(
                backgroundColor: kBackgroundColor,
                elevation: 0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontFamily: 'Prompt',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kWhite,
                ),
                iconTheme: IconThemeData(color: kBlack),
              ),
              scaffoldBackgroundColor: kWhite,
              fontFamily: 'Prompt',
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: StatusLogin(),
          ),
        ),
      ),
    );
  }
}

class StatusLogin extends StatefulWidget {
  const StatusLogin({super.key});

  @override
  State<StatusLogin> createState() => _StatusLoginState();
}

class _StatusLoginState extends State<StatusLogin> {
  Future<Widget>? checkStatusLogin() async {
    await context.read<AppController>().initialize();
    if (mounted) {
      final token = context.read<AppController>().token;
      if (token != null && token != '') {
        return FirstPage();
      } else {
        return const LoginPage1();
      }
    } else {
      return const LoginPage1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkStatusLogin(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                      color: kBackgroundColor, strokeWidth: 5)));
        } else if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data ?? const LoginPage();
        } else if (snapshot.hasError) {
          log('Error: ${snapshot.error}');
          return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                      color: kBackgroundColor, strokeWidth: 5)));
        } else {
          return const LoginPage1();
        }
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
