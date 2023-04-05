import 'package:ar_vegetables/ar_scene.dart';
import 'package:ar_vegetables/share_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:math' as math;


class Meal_time extends StatefulWidget {
  

  @override
  State<Meal_time> createState() => _meal_timeState();
}

class _meal_timeState extends State<Meal_time> {
  @override
  Widget build(BuildContext context) {
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;


    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
          toolbarHeight: heightScreen*0.1,
          
          title: Text(
            "VEGGIES",
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
                  Navigator.push(context, MaterialPageRoute (builder: (context) => Share_meal()));
                },
              
                
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size( widthScreen*0.8, heightScreen*0.39),
                  
                ),
                                    
                child: Center(
                  child: Text(
                    "CONGRATS!\nYOU DID IT!\n\ncontinue...",
                    
                    style: TextStyle(
                      
                      letterSpacing: 2.0,
                      fontSize: widthScreen*0.10,
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