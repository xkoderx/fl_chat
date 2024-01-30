import 'package:chat/screens/screens.dart';
import 'package:flutter/material.dart';

//final Map<String, Widget Function(BuildContext)>
final rutas = {
  'chat': (_) => Chat(),
  'loading': (_) => Loading(),
  'login': (_) => Login(),
  'register': (_) => Register(),
  'users': (_) => Users()
};
