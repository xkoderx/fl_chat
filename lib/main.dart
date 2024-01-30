import 'package:chat/routes/routes.dart';
import 'package:chat/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: rutas,
      home: Login(),
    );
  }
}
