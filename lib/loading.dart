import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("food here"),
      ),
      
      body: Center(
        child: Text(
          "Loading page",
          style: TextStyle(
            fontSize: 50,
          ),
          
        ),
        
      ),
    );
  }
}