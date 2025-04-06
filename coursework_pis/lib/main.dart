import 'package:coursework_pis/core/dependency/dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  await setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
