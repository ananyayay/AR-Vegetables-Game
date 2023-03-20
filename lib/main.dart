import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'food.dart';
import 'ar_scene.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/':(context) => Loading(),
    '/loading':(context) => Loading(),
    '/home':(context) => Home(),
    '/fooditems':(context) => ARScene(),
  }
));
