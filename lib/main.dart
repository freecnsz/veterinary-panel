import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/login/login.dart';
import 'package:flutter_boilerplate/screens/home/home_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: LoginPage.routeName,
      routes: {
        MyHomePage.routeName: (context) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
        LoginPage.routeName: (context) => const LoginPage(),
      },
    );
  }
}
