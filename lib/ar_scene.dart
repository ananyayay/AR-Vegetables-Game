
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_vegetables/loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;

// import 'dart:convert';

// import 'package:flutter/services.dart';


class ARScene extends StatefulWidget {
  const ARScene({super.key});

  @override
  State<ARScene> createState() => _ARSceneState();

}

class _ARSceneState extends State<ARScene> {  

  late ArCoreController arCoreController;
  int score= 0;

  bool currentCard = true;

  bool isBaseButtonClickable= true;
    bool isCheeseButtonClickable= false;
    bool isVeggiesButtonClickable= false;
    bool isConfirmButtonClickable= false;

    bool isGotButtonClickable= true;
    bool textVisibility= true;

    bool carouselVisibility= false;
    bool linearVisibility= false;



    var scores= {"Wheat": 20, "Oats": 40 };
    var tips= {"Wheat" : "Difficult to digest", "Oats":  "Rich in fibre" };
    var visibility= {"Wheat" : true, "Oats": true};

    var tempScores= {"Fat-Free": 40, "Dairy": 20 };
    var tempTips= {"Fat-Free" : "lowers B.P.", "Dairy":  "Causes obesity" };
    var tempVis= {"Fat-Free" : true, "Dairy": true};

    var temp2Scores= {"Tomato": 20, "Capsicum": 40, "Onion" : 20, "Ketchup": 5 };
    var temp2Tips= {"Capsicum" : "Vitamin A, B and E", "Ketchup":  "Very high in Sugar", "Onion": "Has antioxidants" , "Tomato": "Vitamin B and E"};
    var temp2Vis= {"Tomato" : true, "Capsicum": true, "Onion": true, "Ketchup": true};


    List cheeseType = ["Fat-Free", "Dairy"];
    List veggiesType = ["Tomato", "Onion", "Capsicum", "Ketchup"];

    void changeVisibility(String s){
      visibility[s] = !visibility[s]!;
      print(s);
      print(visibility[s]);
      
    }

    List baseitemList = ["Wheat", "Oats"];
    

    List cheeseitemList = ["Fat free", "Normal"];
    List veggiesitemList = ["Tomato", "Capsicum", "Onion"];
    
    List itemList= ["Wheat", "Oats"];

    void SetItemList(){
      if(isBaseButtonClickable==false && isCheeseButtonClickable==false)
      itemList = veggiesitemList;

      else if(isVeggiesButtonClickable==false && isCheeseButtonClickable==false)
      itemList = baseitemList;

      else if(isBaseButtonClickable==false && isVeggiesButtonClickable==false)
      itemList = cheeseitemList;
    }

    void SetTypeVisible(){
      print("entered settype");
      print(isBaseButtonClickable);
      print(isCheeseButtonClickable);
      print(isVeggiesButtonClickable);
      
      
      if(isBaseButtonClickable==true)
      {
        isCheeseButtonClickable= true;
        isBaseButtonClickable = false;
      }

      else if(isCheeseButtonClickable== true)
      {
        isVeggiesButtonClickable = true;
        isCheeseButtonClickable = false;
        print("is it hapening?");
      }

      else if(!isVeggiesButtonClickable && !isCheeseButtonClickable && !isBaseButtonClickable){
        isVeggiesButtonClickable= true;

      }
      else if(isVeggiesButtonClickable){
        isVeggiesButtonClickable= false;

      }
    }

    void checkScore(){
      if(score >= 100){
        // isConfirmButtonClickable= true;
      }
    }

    void hideInstructions(){
      textVisibility=false;
    }

    void hideButton(){
      setState(() {
        isGotButtonClickable=false;
        print("set state");
      });
    } 



  @override
  Widget build(BuildContext context) {
    // return 
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;

    

    
    
    // Future<List<Food>>

    
    return Scaffold(
      
      body: Container(
        child: Stack(
          children: <Widget>[

            
            SizedBox(
              height: heightScreen,
              // child: ArCoreView(
              //   onArCoreViewCreated: _onArCoreViewCreated,
              //   enableTapRecognizer: true,
              // ),
              child: Container(
                color: Colors.limeAccent,
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50.0,0,0),
              
              child: Container(
                decoration: BoxDecoration(
                color: Colors.transparent,
                
                ),
                alignment: Alignment.topCenter,    
                    
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Opacity(
                          opacity: isBaseButtonClickable? 1.0:0.55,

                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            
                            height: 0.12*heightScreen,
                            width: 0.12*heightScreen,
                            child: Padding(
                              padding:  EdgeInsets.all( 0.008*heightScreen ),
                                              
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  
                                  child: IconButton(
                                    
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      print("object");
                                      Navigator.push(context, MaterialPageRoute (builder: (context) => Loading()));
                                    },
                                    
                                    icon: Image.asset("assets/images/pizza_base.jpg"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Opacity(
                          
                          opacity: isCheeseButtonClickable ? 1.0: 0.55,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            
                            height: 0.12*heightScreen,
                            width: 0.12*heightScreen,
                            child: Padding(
                              padding:  EdgeInsets.all( 0.008*heightScreen ),
                                              
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute (builder: (context) => Loading()));
                                      if(isCheeseButtonClickable){
                                        

                                      }
                                    },
                                    icon: Image.asset("assets/images/cheese.jpg"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Opacity(
                          opacity: isVeggiesButtonClickable? 1.0:0.55,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            
                            height: 0.12*heightScreen,
                            width: 0.12*heightScreen,
                            child: Padding(
                              padding:  EdgeInsets.all( 0.008*heightScreen ),
                                              
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute (builder: (context) => Loading()));
                                    },
                                    icon: Image.asset("assets/images/toppings.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
            
            
                    ],
                    ),
                
              ),
            ),


            

            Padding(
              padding: const EdgeInsets.all(5.0),
              
              
              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                
                children: [
                
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                    
                    Visibility(
                      visible: textVisibility,
                      child: Text(
                        "Swipe to see all options.\nSelect the image and confirm.",
                    
                        style: TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontSize: widthScreen*0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Indie',
                        ),
                      ),
                    ),
                      
                    SizedBox(width: widthScreen*0.04,),
                    
                    Opacity(
                      opacity: isConfirmButtonClickable? 1:0.4,
                      child: ElevatedButton(
                    
                    onPressed: () {
                      if(isConfirmButtonClickable){

                        SetTypeVisible();
                        print("clickable set type done");

                        setState(() {
                          print("entered setstate");

                          if(isCheeseButtonClickable){ 
                            print("entered cheese");
                            scores = tempScores;
                            tips = tempTips;
                            visibility = tempVis;
                            itemList = cheeseType;
                          }
                          if(isVeggiesButtonClickable){
                            print("entered veggies");
                            scores = temp2Scores;
                            tips = temp2Tips;
                            visibility = temp2Vis;
                            itemList = veggiesType;
                            print("this happen?");
                          }
                          if(!isVeggiesButtonClickable && !isBaseButtonClickable && !isCheeseButtonClickable){ 
                            print("entered all");
                          } 
                        }
                        );
                        

                      }
                    },
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6E29),
                      fixedSize: Size( widthScreen*0.25, heightScreen*0.06),
                      
                    ),
                      
                    child: Text(
                      "CONFIRM",
                      
                      style: TextStyle(
                        
                        letterSpacing: 2.0,
                        fontSize: widthScreen*0.036,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Indie',
                      ), 
                    
                    ),
                      
                      
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: heightScreen*0.04,
                ),
              
                  Container(
                  decoration: BoxDecoration(
                  color: Colors.transparent,
                  
                  ),
                  
                      
                  child: Opacity(
                    opacity: (carouselVisibility)? 1: 0.5,
                    child: CarouselSlider(
                      
                                
                      items: itemList.map((e) {
                      
                      
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(color:  Color.fromARGB(255, 3, 171, 154),
                        borderRadius: BorderRadius.circular(10)
                          
                        ),
                        
                        child: Row(
                          children: [
                  
                            Padding(
                            padding: const EdgeInsets.all(10.0),
                                      
                            child: Row(
                              
                              children: <Widget>[
                                
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                      
                                      height: 0.14*heightScreen,
                                      width: 0.14*heightScreen,
                                      child: Padding(
                                        padding:  EdgeInsets.all( 0.008*heightScreen ),
                                
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16.0),
                                          child: Container(
                                            
                                            child: Opacity(
                                              opacity: (visibility[e]!)?1:0.5,

                                              child: IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  setState(() {
                                                    var temp = scores[e]?.toInt()?? 0;
                                                    if(visibility[e]!){
                                                      score+= temp;       
                                                      isConfirmButtonClickable= true;                                               
                                                    }
                                                    if(!visibility[e]!){
                                                      score-= temp;     
                                                      isConfirmButtonClickable= false;                                                  
                                                    }
                                                    changeVisibility(e);
                                                    
                                                  });
                                            
                                                },
                                                icon: Image.asset("assets/images/$e.jpg"),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                  
                                    SizedBox(
                                      width: widthScreen*0.03,
                                    ),
                        
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                        width: widthScreen*0.35,
                                        height: heightScreen*0.04,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 2, 90, 75),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        
                                        child: Text(
                                          "$e ",
                                          style: TextStyle(
                                            color: Colors.white,
                  
                                            letterSpacing: 2.0,
                                            fontSize: widthScreen*0.05,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Indie',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                  
                                      
                                      Container(
                                        width: widthScreen*0.35,
                                        height: heightScreen*0.04,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        
                                        child: Text(
                                          "SCORE ${scores[e]}",
                                          style: TextStyle(
                                            color: Colors.black,
                  
                                            letterSpacing: 2.0,
                                            fontSize: widthScreen*0.05,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Indie',
                                            
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                  
                  
                                      Container(
                  
                                        width: widthScreen*0.35,
                                        height: heightScreen*0.05,
                                        
                                        decoration: BoxDecoration(
                                          color: Colors.yellow[800],
                                          borderRadius: BorderRadius.all(Radius.circular(14)),
                                        ),
                                        
                  
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(heightScreen*0.015, 0, 0, 0),
                                          child: Text(
                                            "Tip: \n${tips[e]}",
                                            style: TextStyle(
                                              letterSpacing: 2.0,
                                              color: Colors.black,
                                              fontSize: widthScreen*0.025,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Indie',
                                            ),
                                            
                                          ),
                                        ),
                                      ),
                                      ]
                                    ),
                  
                                     
                  
                                      
                                    
                              ],
                                
                              ),
                          ),
                  
                          ],
                          
                          
                        ),
                        
                      );
                                
                      }).toList(),
                            options: CarouselOptions(
                              height: 0.2*heightScreen,
                              
                            ),
                            
                      ),
                  ),
                ),
              
              
                ],
              
                
              ),
            ),

            Visibility(
              visible: isGotButtonClickable,
              child: Center(
                child: ElevatedButton(
                
                onPressed: () {
                  setState(() {
                     isGotButtonClickable = false;     
                      carouselVisibility = true;
                      linearVisibility = true;
                      textVisibility=false;
                  });
                 

                },
              
                
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size( widthScreen*0.5, heightScreen*0.15),
                  
                ),
                                    
                child: Center(
                  child: Text(
                    "GOT IT!",
                    
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

            Visibility(
              visible: textVisibility,
              child: Padding(
                
                padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Text(
                  "Choose the healthy option below!",
              
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.grey[900],
                    letterSpacing: 2.0,
                    fontSize: widthScreen*0.05,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Indie',
                  ),
                  
                ),
              ),
            ),

            Column(
            mainAxisAlignment: MainAxisAlignment.values[2],
            
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                  
                  child: RotatedBox(
                    quarterTurns: -1,
                    
                    child: Opacity(
                      opacity: (linearVisibility)? 1: 0.5,
                      child: LinearPercentIndicator(
                        width: heightScreen*0.40,
                        lineHeight: widthScreen*0.090,
                        animation: true,
                animationDuration: 700,
                animateFromLastPercent: true,
                leading: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "${(score>=100)?100:(score)}%",
                   
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: widthScreen*0.05,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                        percent: (score>100)?1:(score/100),
                        barRadius: Radius.circular(40),
                        progressColor: Colors.green,
                        backgroundColor: Colors.lightGreen,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        // alignment: Alignment.bottomCenter,
                      ),
                    ),
                    
                  ),
                ),
              )
            ],
            )
          ],
          
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    // final material = ArCoreMaterial(color: Colors.blue);
    // final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    // final node = ArCoreNode(
    //   shape: sphere,
    //   position: vector.Vector3(0, 0, -1),
    // );
    var node = ArCoreReferenceNode(
      
      objectUrl: "assets/models/pizza.gltf"
      // object3DFileName: "assets/models/pizza.gltf"

    );
    controller.addArCoreNode(node);
  }

  // void _onArCoreViewCreated(ArCoreController controller) {
  //   arCoreController = controller;
    
  //   ArCoreReferenceNode node = ArCoreReferenceNode(
  //     name: 'myNode',
  //     objectUrl: "assets/models/pizza.gltf",
  //     position: vector.Vector3(0, 0, -1),
  //     scale: vector.Vector3(10, 10, 10),
  //   );

  //   arCoreController.addArCoreNode(node);

  //   _addNode();

  // }
  

  // void _addNode() {
  //   ArCoreMaterial material = ArCoreMaterial(color: Colors.amber);

  //   ArCoreSphere sphere = ArCoreSphere(
  //     materials: [material],
  //     radius: 0.1,
  //   );

  //   var node = ArCoreNode(
  //     shape: sphere,
  //     position: vector.Vector3(0, 0, -2),
  //     scale: vector.Vector3(1, 1, 1),
  //   );

  //   arCoreController.addArCoreNode(node);
  // }

}