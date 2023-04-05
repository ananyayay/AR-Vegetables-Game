import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'ar_scene.dart';
import 'dart:math';
import 'game.dart';

// import 'dart:convert';

// import 'package:flutter/services.dart';


class Dish extends StatefulWidget {
  Dish({super.key, required this.game});

  // Declare a field that holds the Todo.
  Game game;
  
  @override
  State<Dish> createState() => _MyAppState(game);
}

class _MyAppState extends State<Dish> {
  
  Game game;

  _MyAppState(this.game);


  

  @override  
  Widget build(BuildContext context) {
    
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;
    
    var list = ["one PIZZA !", "North Indian"]  ;
    var random = Random().nextInt(2);

    var dishName = list[random];

    game.setDish(dishName);


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
        backgroundColor: Colors.yellow,
        
        body: Container(
          child: Column(
            
            // mainAxisAlignment: MainAxisAlignment.center,
          
            children: <Widget>[
              
              Container(
                alignment: Alignment.topLeft,

                width: widthScreen,
                height: 0.46*heightScreen,
                
              
                child: Stack(
              
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.fromLTRB(0.07*widthScreen, 0.03*widthScreen, 0, 0),
                      child: const Image(
                        image: AssetImage("assets/images/dialogue2.png"),
                        width: 900,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    
              
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 40, 70, 0),

                      // padding: const EdgeInsets.all(0.0),

                      child: Stack(
                        
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.fromLTRB(45, 8, 0, 0),
                            child: Text(
                              "${game.person} \nhas ordered \n\n\nAre you ready to make it?",
                              textAlign: TextAlign.center,
                          
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: widthScreen*0.056,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Indie',
                                color: Colors.white,
                                height: widthScreen*0.0031,
                                
                              ), 
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 80, 0, 0),
                            child: Text(
                              game.dish,
                              textAlign: TextAlign.center,
                          
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: widthScreen*0.09,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Indie',
                                color: Colors.white,
                                
                              ), 
                            ),
                          ),
                          
                        ],
                      ),
                    ),
              
                    
                  ],
                ),
                
              ),

              Image(
                
                image: AssetImage("assets/images/guy2.png"),
                width: 0.4*heightScreen,
                height: 0.3*heightScreen,
                // alignment: Alignment(2, ),
                alignment: Alignment.bottomLeft,
              ),
              
              ElevatedButton(
                
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute (builder: (context) => ARScene()));
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6E29),
                  fixedSize: Size( widthScreen*0.3, heightScreen*0.065),
                  
                ),
              
                child: Text(
                  "PLAY",
                  
                  style: TextStyle(
                    
                    letterSpacing: 2.0,
                    fontSize: widthScreen*0.055,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Indie',
                  ), 
                
                ),
              
              
              ),


              
          
            ],
          ),
        ),
      ),
      //DEBUGBANNER FALSE NOT WORKINGGGGGGG
      debugShowCheckedModeBanner: false,
    );
    
  }
}
