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
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARCore Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Veggies"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        backgroundColor: Colors.yellow,
        
        // body: ARScene(),
        body: Container(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: <Widget>[
              
              ElevatedButton(
                
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute (builder: (context) => ARScene()));
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
                  Navigator.push(context, MaterialPageRoute (builder: (context) => ARScene()));
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

              Container(
                // child:  IconButton(
                //   onPressed: () => {},
                //   icon: Image.asset("assets/pizza.png"),
                // ),
                alignment:Alignment.bottomCenter,
                child: Image(
                  image: AssetImage("assets/veggies.png"),
                  
                  ),
              ),
          
            ],
          ),
        ),
      ),
      
    );
    
  }
}
