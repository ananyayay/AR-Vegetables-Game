import 'package:ar_vegetables/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:math' as math;

class Share_meal extends StatelessWidget {
  const Share_meal({super.key});

  
  @override
  Widget build(BuildContext context) {
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;


    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
          toolbarHeight: heightScreen*0.1,
          
          title: Text(
            "Veggies",
            style: TextStyle(
              fontFamily: "Indie",
              fontWeight: FontWeight.w900,
              fontSize: widthScreen*0.1,
              letterSpacing: widthScreen*0.01
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
    
        body: Center(
          child: Center(
                child: ElevatedButton(
                
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute (builder: (context) => Home()));
                },
              
                
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size( widthScreen*0.8, heightScreen*0.39),
                  
                ),
                                    
                child: Center(
                  
                  child: Text(
                    "Spiderman wants to share it with you!",
                    
                    style: TextStyle(
                      
                      letterSpacing: 2.0,
                      fontSize: widthScreen*0.09,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Indie',
                    ), 
                    
                  
                  ),
                ),
              
                                    ),
                    
                    ),
                  ),
                
        ),
    );
  }
}