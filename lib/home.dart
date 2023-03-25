import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'ar_scene.dart';
import 'order.dart';


class Home extends StatefulWidget {
  
  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  
  @override  
  Widget build(BuildContext context) {
    
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;
    

    return MaterialApp( 
      
      title: 'ARCore Demo',
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
            
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: <Widget>[
              SizedBox(
                height: heightScreen*0.14,
              ),
              ElevatedButton(
                
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute (builder: (context) => Order()));
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size( widthScreen*0.6, heightScreen*0.1),
                  
                ),
                
                child: Text(
                  "Start Game",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontSize: widthScreen*0.07,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Indie',
                  ),  
                  
                ),
                
              ),
              SizedBox(
                width: widthScreen*0.1,
                height: heightScreen*0.03,
              ),
          
              ElevatedButton(
                
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute (builder: (context) => Order()));
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size( widthScreen*0.6, heightScreen*0.1),
                  
                ),

                child: Text(
                  "How to Play",
                  
                  style: TextStyle(
                    
                    letterSpacing: 2.0,
                    fontSize: widthScreen*0.07,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Indie',
                  ), 
                
                ),


              ),

              SizedBox(
                height: heightScreen*0.07,
              ),

              Container(
                // child:  IconButton(
                //   onPressed: () => {},
                //   icon: Image.asset("assets/images/pizza.png"),
                // ),
                
                child: Image(
                  image: AssetImage("assets/images/veggies.png"),
                  
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
