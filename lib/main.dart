import 'package:ar_vegetables/meal_time.dart';
import 'package:ar_vegetables/share_meal.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'order.dart';
import 'ar_scene.dart';

void main() => runApp(MaterialApp(
  
  initialRoute: '/home',
  routes: {
    '/':(context) => Loading(),
    '/loading':(context) => Loading(),
    '/home':(context) => Home(),
    '/order':(context) => Order(),
    '/fooditems':(context) => ARScene(),
    '/meal':(context) => Meal_time(),
    '/sharemeal':(context) => Share_meal(),
  }
));
