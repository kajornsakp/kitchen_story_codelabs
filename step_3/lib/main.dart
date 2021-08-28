import 'package:flutter/material.dart';
import 'package:kitchen_story/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouterDelegate _routerDelegate = AppRouterDelegate();
  AppRouteInformationParser _routeInformationParser = AppRouteInformationParser();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}