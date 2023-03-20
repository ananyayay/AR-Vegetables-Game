import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'ar_scene.dart';


class Home extends StatefulWidget {
  
  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'ARCore Demo',
      home: Scaffold(
        body: ARScene(),
      ),
      
    );
    
  }
}
