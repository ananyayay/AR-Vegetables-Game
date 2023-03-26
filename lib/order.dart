import 'package:ar_vegetables/dish.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'game.dart';

class Order extends StatefulWidget {
  
  @override
  State<Order> createState() => _MyAppState();
}

class _MyAppState extends State<Order> {
  
  @override  
  Widget build(BuildContext context) {
    
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;
    
    var list = ["Spiderman", "The Mario", "ShinChan", "Mr Jumbo", "Tweety", "Doraemon", "Jerry", "Our Tom"]  ;
    var random = Random().nextInt(8);

    var person = list[random];

    Game game = Game(1, person, "");
    

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
                // color: Colors.blueAccent,

                width: widthScreen,
                height: 0.46*heightScreen,
                
              
                child: Stack(
              
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(0.03*widthScreen),
                      child: Image(
                        
                        image: AssetImage("assets/images/dialogue.png"),
                        width: 760,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    
              
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 65, 200,20),

                      // padding: const EdgeInsets.all(0.0),

                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Hey! $person has placed an order! Let's prepare it!",
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            letterSpacing: 0.4,
                            fontSize: widthScreen*0.056,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Indie',
                            color: Colors.white,
                            
                          ), 
                          ),
                      ),
                    ),
              
                    
                  ],
                ),
                
              ),

              Image(
                
                image: AssetImage("assets/images/guy.png"),
                width: 0.45*heightScreen,
                height: 0.3*heightScreen,
                // alignment: Alignment(2, ),
                alignment: Alignment.bottomRight,
              ),
              
              ElevatedButton(
                
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute (builder: (context) => Dish(game: game)));
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE35879),
                  fixedSize: Size( widthScreen*0.3, heightScreen*0.065),
                  
                ),
              
                child: Text(
                  "NEXT",
                  
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
