import 'package:flutter/material.dart';
import 'package:new_flutter_project_seun/onboarding.dart';
import 'package:new_flutter_project_seun/screen/home.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Chat",
        theme: ThemeData(
        primarySwatch: Colors.orange,
    ),
    home: const Onboarding(),
    );
  }
}

