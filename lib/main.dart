import 'package:flutter/material.dart';
import 'ar_scene.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title: 'ARCore Demo',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Checking in'),
        //   backgroundColor: Colors.teal,
        // ),
        body: ARScene(),
      ),
      
    );
    
  }
}
